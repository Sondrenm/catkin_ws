classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2017 The MathWorks, Inc.
    
    properties (Constant)
        tugboat_control_BoatPose = 'tugboat_control/BoatPose'
        tugboat_control_PushingForce = 'tugboat_control/PushingForce'
        tugboat_control_ShipControlInput = 'tugboat_control/ShipControlInput'
        tugboat_control_Thrust = 'tugboat_control/Thrust'
        tugboat_control_TugControlCommand = 'tugboat_control/TugControlCommand'
        tugboat_control_TugSetpoints = 'tugboat_control/TugSetpoints'
        tugboat_control_TugStatus = 'tugboat_control/TugStatus'
        tugboat_control_Waypoint = 'tugboat_control/Waypoint'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(8, 1);
                msgList{1} = 'tugboat_control/BoatPose';
                msgList{2} = 'tugboat_control/PushingForce';
                msgList{3} = 'tugboat_control/ShipControlInput';
                msgList{4} = 'tugboat_control/Thrust';
                msgList{5} = 'tugboat_control/TugControlCommand';
                msgList{6} = 'tugboat_control/TugSetpoints';
                msgList{7} = 'tugboat_control/TugStatus';
                msgList{8} = 'tugboat_control/Waypoint';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
        
        function actionList = getActionList
            %getActionList Generate a cell array with all action types.
            %   The list will be sorted alphabetically.
            
            persistent actList
            if isempty(actList)
                actList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
