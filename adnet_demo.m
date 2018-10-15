function [t,p, results] = adnet_demo (vid_path)
% ADNET_DEMO Demonstrate `action-decision network'
% ��Ŀ����٣�����ᶯ
% vid_path�� �������һ��ͼƬ�ļ��У�һ����ע�ļ�groundtruth_rect.txt
%           ��ע�ļ����ÿһ����һ���򣬰����ĸ����꣬�ö��ŷֿ�
% 
% HaiDong Wang, 2018��10��15��.

if nargin < 1       %����û�в�����ʱ�򣬸��ٵ���Ƶ���ݴ�data/Freeman1�н��ж�ȡ
    vid_path = 'data/Freeman1';
end

addpath('test/');
addpath(genpath('utils/'));     % ����utilsĿ¼�Լ�����Ŀ¼�µ�·��

init_settings;

run(matconvnet_path);

load('models/net_rl.mat');

opts.visualize = true;
opts.printscreen = true;

rng(1004);
[results, t, p] = adnet_test(net, vid_path, opts);
fprintf('precision: %f, fps: %f\n', p(20), size(results, 1)/t);

