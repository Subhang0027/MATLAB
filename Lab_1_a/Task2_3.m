load_system('Task_2.slx');
initial_angle=3.14/4;
iteration=1;

for idx=1:iteration
    simJob=sim('Task_2.slx',100);
    initial_angle=initial_angle+0.00125;
    disp(initial_angle);
    disp(idx);
    disp(mean(Error_measure))
end
