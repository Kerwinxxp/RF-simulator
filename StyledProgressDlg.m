classdef StyledProgressDlg < handle
    % Prettier alternative to uiprogressdlg with a compatible interface.
    % Supported name-value pairs: Title, Message, Cancelable, Value.
    % Read/write properties: Value (0..1), Message (string).
    % Read-only property: CancelRequested (logical).

    properties (Dependent)
        Value           double
        Message         string
        CancelRequested logical
    end

    properties (Access = private)
        Fig
        TitleLabel
        MsgLabel
        BarBG
        BarFill
        PctLabel
        CancelBtn
        ValueInternal   double  = 0
        MessageInternal string  = ""
        CancelFlag      logical = false
        BarMaxWidth     double  = 0
        BarOriginX      double  = 0
        BarOriginY      double  = 0
        BarHeight       double  = 0
    end

    methods
        function obj = StyledProgressDlg(parentFig, varargin)
            p = inputParser;
            addParameter(p, 'Title', 'Processing');
            addParameter(p, 'Message', 'Please wait...');
            addParameter(p, 'Cancelable', 'off');
            addParameter(p, 'Value', 0);
            parse(p, varargin{:});

            titleText    = char(string(p.Results.Title));
            msgText      = char(string(p.Results.Message));
            isCancelable = strcmpi(char(string(p.Results.Cancelable)), 'on');
            initValue    = max(0, min(1, p.Results.Value));

            w = 500; h = 190;
            if nargin >= 1 && ~isempty(parentFig) && isvalid(parentFig)
                pp = parentFig.Position;
                x = pp(1) + pp(3)/2 - w/2;
                y = pp(2) + pp(4)/2 - h/2;
            else
                x = 500; y = 350;
            end

            obj.Fig = uifigure('Name', titleText, ...
                'Position', [x y w h], ...
                'Resize', 'off', ...
                'WindowStyle', 'modal', ...
                'Color', [0.975 0.978 0.992], ...
                'CloseRequestFcn', @(~,~) obj.onClose());

            % Top accent strip (subtle brand stripe)
            uilabel(obj.Fig, 'Text', '', ...
                'Position', [0 h-4 w 4], ...
                'BackgroundColor', [0.24 0.50 0.95]);

            % Title
            obj.TitleLabel = uilabel(obj.Fig, ...
                'Text', titleText, ...
                'Position', [26 h-50 w-52 28], ...
                'FontSize', 15, ...
                'FontWeight', 'bold', ...
                'FontColor', [0.12 0.18 0.34]);

            % Message
            obj.MsgLabel = uilabel(obj.Fig, ...
                'Text', msgText, ...
                'Position', [26 h-82 w-52 22], ...
                'FontSize', 11, ...
                'FontColor', [0.42 0.46 0.58]);

            % Percentage (above bar, right-aligned)
            margin = 26;
            barW = w - 2*margin;
            barH = 12;
            barY = 62;
            obj.BarMaxWidth = barW;
            obj.BarOriginX  = margin;
            obj.BarOriginY  = barY;
            obj.BarHeight   = barH;

            obj.PctLabel = uilabel(obj.Fig, ...
                'Text', sprintf('%d%%', round(initValue*100)), ...
                'Position', [margin barY+barH+6 barW 18], ...
                'FontSize', 11, ...
                'FontWeight', 'bold', ...
                'HorizontalAlignment', 'right', ...
                'FontColor', [0.30 0.40 0.70]);

            % Progress bar background
            obj.BarBG = uilabel(obj.Fig, ...
                'Text', '', ...
                'Position', [margin barY barW barH], ...
                'BackgroundColor', [0.90 0.92 0.96]);

            % Progress bar fill
            fillW = max(1, round(barW * initValue));
            obj.BarFill = uilabel(obj.Fig, ...
                'Text', '', ...
                'Position', [margin barY fillW barH], ...
                'BackgroundColor', [0.24 0.50 0.95]);

            % Cancel button
            if isCancelable
                obj.CancelBtn = uibutton(obj.Fig, ...
                    'Text', 'Cancel', ...
                    'Position', [w-118 14 92 30], ...
                    'FontSize', 11, ...
                    'BackgroundColor', [0.97 0.95 0.98], ...
                    'FontColor', [0.45 0.20 0.45], ...
                    'ButtonPushedFcn', @(~,~) obj.onCancel());
            end

            obj.ValueInternal   = initValue;
            obj.MessageInternal = string(msgText);

            drawnow;
        end

        function v = get.Value(obj)
            v = obj.ValueInternal;
        end

        function set.Value(obj, v)
            v = max(0, min(1, double(v)));
            obj.ValueInternal = v;
            if ~isempty(obj.Fig) && isvalid(obj.Fig) ...
                    && ~isempty(obj.BarFill) && isvalid(obj.BarFill)
                fillW = max(1, round(obj.BarMaxWidth * v));
                obj.BarFill.Position = [obj.BarOriginX obj.BarOriginY fillW obj.BarHeight];
                if ~isempty(obj.PctLabel) && isvalid(obj.PctLabel)
                    obj.PctLabel.Text = sprintf('%d%%', round(v*100));
                end
                drawnow limitrate;
            end
        end

        function m = get.Message(obj)
            m = obj.MessageInternal;
        end

        function set.Message(obj, m)
            ms = string(m);
            obj.MessageInternal = ms;
            if ~isempty(obj.MsgLabel) && isvalid(obj.MsgLabel)
                obj.MsgLabel.Text = char(ms);
                drawnow limitrate;
            end
        end

        function c = get.CancelRequested(obj)
            % flush event queue so the cancel-button callback has a chance
            % to fire inside a tight MATLAB loop
            drawnow limitrate;
            c = obj.CancelFlag;
        end

        function delete(obj)
            if ~isempty(obj.Fig) && isvalid(obj.Fig)
                delete(obj.Fig);
            end
        end
    end

    methods (Access = private)
        function onCancel(obj)
            obj.CancelFlag = true;
            if ~isempty(obj.CancelBtn) && isvalid(obj.CancelBtn)
                obj.CancelBtn.Text = 'Cancelling...';
                obj.CancelBtn.Enable = 'off';
                obj.CancelBtn.BackgroundColor = [0.93 0.91 0.94];
                obj.CancelBtn.FontColor = [0.55 0.40 0.55];
            end
            if ~isempty(obj.MsgLabel) && isvalid(obj.MsgLabel)
                obj.MsgLabel.Text = 'Cancel requested, finishing current step...';
                obj.MsgLabel.FontColor = [0.70 0.35 0.35];
            end
            drawnow;
        end

        function onClose(obj)
            obj.CancelFlag = true;
            if ~isempty(obj.Fig) && isvalid(obj.Fig)
                delete(obj.Fig);
            end
        end
    end
end
