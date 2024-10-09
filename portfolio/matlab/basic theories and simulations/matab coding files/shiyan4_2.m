% DH参数
dh_params = [0, 0, 0, theta1;
             -pi/2, 0, d2, theta2;
             0, a2, 0, theta3;
             -pi/2, a3, 0, theta4];

% 各关节运动的DH矩阵
DH_matrices = [];
for i = 1:size(dh_params, 1)
    alpha = dh_params(i, 1);
    a = dh_params(i, 2);
    d = dh_params(i, 3);
    theta = dh_params(i, 4);
    
    DH = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta);
          sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
          0 sin(alpha) cos(alpha) d;
          0 0 0 1];
      
    DH_matrices = [DH_matrices DH];
end

% 机器人的运动学模型
T = eye(4);
for i = 1:size(DH_matrices, 2)
    T = T * DH_matrices(:, :, i);
end

% 设置目标位姿
target_pose = [x, y, z, roll, pitch, yaw]; % 设置目标位置和姿态

% 计算机器人末端执行器的位姿
end_effector_pose = T(1:3, 4);
end_effector_orientation = [T(1:3,1:3)]; % 姿态矩阵
% 根据具体需要将姿态矩阵转化为欧拉角或四元数

% 计算误差
position_error = norm(target_pose(1:3) - end_effector_pose);
% orientation_error = % 根据具体需要计算姿态误差

% 输出结果
disp("机器人末端执行器的位姿：");
disp(["位置：" num2str(end_effector_pose')]);
disp(["姿态：" num2str(end_effector_orientation)]);
disp("位置误差：" + string(position_error));
disp("姿态误差：" + string(orientation_error));