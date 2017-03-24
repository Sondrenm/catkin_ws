classdef Waypoint < robotics.ros.Message
    %Waypoint MATLAB implementation of tugboat_control/Waypoint
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2017 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'tugboat_control/Waypoint' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'ac21d14c0ba92bbf8f535b458744d831' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        ID
        X
        Y
        Theta
        V
    end
    
    properties (Constant, Hidden)
        PropertyList = {'ID', 'Theta', 'V', 'X', 'Y'} % List of non-constant message properties
        ROSPropertyList = {'ID', 'theta', 'v', 'x', 'y'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = Waypoint(msg)
            %Waypoint Construct the message object Waypoint
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function id = get.ID(obj)
            %get.ID Get the value for property ID
            id = typecast(int8(obj.JavaMessage.getID), 'uint8');
        end
        
        function set.ID(obj, id)
            %set.ID Set the value for property ID
            validateattributes(id, {'numeric'}, {'nonempty', 'scalar'}, 'Waypoint', 'ID');
            
            obj.JavaMessage.setID(id);
        end
        
        function x = get.X(obj)
            %get.X Get the value for property X
            x = double(obj.JavaMessage.getX);
        end
        
        function set.X(obj, x)
            %set.X Set the value for property X
            validateattributes(x, {'numeric'}, {'nonempty', 'scalar'}, 'Waypoint', 'X');
            
            obj.JavaMessage.setX(x);
        end
        
        function y = get.Y(obj)
            %get.Y Get the value for property Y
            y = double(obj.JavaMessage.getY);
        end
        
        function set.Y(obj, y)
            %set.Y Set the value for property Y
            validateattributes(y, {'numeric'}, {'nonempty', 'scalar'}, 'Waypoint', 'Y');
            
            obj.JavaMessage.setY(y);
        end
        
        function theta = get.Theta(obj)
            %get.Theta Get the value for property Theta
            theta = double(obj.JavaMessage.getTheta);
        end
        
        function set.Theta(obj, theta)
            %set.Theta Set the value for property Theta
            validateattributes(theta, {'numeric'}, {'nonempty', 'scalar'}, 'Waypoint', 'Theta');
            
            obj.JavaMessage.setTheta(theta);
        end
        
        function v = get.V(obj)
            %get.V Get the value for property V
            v = double(obj.JavaMessage.getV);
        end
        
        function set.V(obj, v)
            %set.V Set the value for property V
            validateattributes(v, {'numeric'}, {'nonempty', 'scalar'}, 'Waypoint', 'V');
            
            obj.JavaMessage.setV(v);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.ID = obj.ID;
            cpObj.X = obj.X;
            cpObj.Y = obj.Y;
            cpObj.Theta = obj.Theta;
            cpObj.V = obj.V;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.ID = strObj.ID;
            obj.X = strObj.X;
            obj.Y = strObj.Y;
            obj.Theta = strObj.Theta;
            obj.V = strObj.V;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.ID = obj.ID;
            strObj.X = obj.X;
            strObj.Y = obj.Y;
            strObj.Theta = obj.Theta;
            strObj.V = obj.V;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.tugboat_control.Waypoint.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.tugboat_control.Waypoint;
            obj.reload(strObj);
        end
    end
end