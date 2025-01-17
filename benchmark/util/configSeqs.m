function seqs=configSeqs

if ispc
    dataPathPrefix = 'D:\workspace\rl\DRLT\OTB100\OTB100';
else
    dataPathPrefix = '/home/laoli/rl/OTB100';
end

seqVTD={
%     struct('name','soccer','path','D:\workspace\rl\DRLT\OTB100\OTB100\Soccer\img\','startFrame',1,'endFrame',392,'nz',4,'ext','jpg','init_rect', [93,231,350,392]),...
%     struct('name','matrix','path','d:\data_seq\matrix\','startFrame',1,'endFrame',100,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','ironman','path','d:\data_seq\ironman\','startFrame',1,'endFrame',166,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','deer','path','d:\data_seq\deer\','startFrame',1,'endFrame',71,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','skating1','path','d:\data_seq\skating1\','startFrame',1,'endFrame',400,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','shaking','path','d:\data_seq\shaking\','startFrame',1,'endFrame',365,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','singer1','path','d:\data_seq\singer1\','startFrame',1,'endFrame',351,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','singer2','path','d:\data_seq\singer2\','startFrame',1,'endFrame',366,'nz',4,'ext','jpg','init_rect', [0,0,0,0])
    };

seqIVT={
    struct('name','carDark','path',[fullfile(dataPathPrefix, 'CarDark', 'img'), filesep],'startFrame',1,'endFrame',393,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','car4','path','D:\workspace\rl\DRLT\OTB100\OTB100\car4\img\','startFrame',1,'endFrame',659,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','david','path','D:\workspace\rl\DRLT\OTB100\OTB100\david_c\img\','startFrame',300,'endFrame',770,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','david2','path','D:\workspace\rl\DRLT\OTB100\OTB100\david2\img','startFrame',1,'endFrame',537,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...    
%     struct('name','sylvester','path','D:\workspace\rl\DRLT\OTB100\OTB100\sylvester\img','startFrame',1,'endFrame',1345,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','trellis','path','D:\workspace\rl\DRLT\OTB100\OTB100\trellis_c\img\','startFrame',1,'endFrame',569,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','fish','path','D:\workspace\rl\DRLT\OTB100\OTB100\fish\img\','startFrame',1,'endFrame',476,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','mhyang','path','D:\workspace\rl\DRLT\OTB100\OTB100\mhyang\img\','startFrame',1,'endFrame',1490,'nz',4,'ext','jpg','init_rect', [0,0,0,0])
    };

seqOther={
%     struct('name','coke','path','d:\data_seq\coke_c\','startFrame',1,'endFrame',291,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','bolt','path','d:\data_seq\bolt\','startFrame',1,'endFrame',350,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','boy','path','d:\data_seq\boy\','startFrame',1,'endFrame',602,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','dudek','path','d:\data_seq\dudek\','startFrame',1,'endFrame',1145,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','crossing','path','d:\data_seq\crossing\','startFrame',1,'endFrame',120,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','couple','path','d:\data_seq\couple\','startFrame',1,'endFrame',140,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','football1','path','d:\data_seq\football1\','startFrame',1,'endFrame',74,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','jogging-1','path','d:\data_seq\jogging\','startFrame',1,'endFrame',307,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','jogging-2','path','d:\data_seq\jogging\','startFrame',1,'endFrame',307,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','doll','path','d:\data_seq\doll\','startFrame',1,'endFrame',3872,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','girl','path','d:\data_seq\girl\','startFrame',1,'endFrame',500,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
    struct('name','walking2','path',[fullfile(dataPathPrefix, 'Walking2', 'img'), filesep],'startFrame',1,'endFrame',500,'nz',4,'ext','jpg','init_rect', [188,233,370,378]),...
%     struct('name','walking','path','D:\workspace\rl\DRLT\OTB100\OTB100\Walking\img\','startFrame',1,'endFrame',412,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','fleetface','path','d:\data_seq\fleetface\','startFrame',1,'endFrame',707,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','freeman1','path','D:\workspace\rl\DRLT\OTB100\OTB100\Freeman1\img\','startFrame',1,'endFrame',326,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','freeman3','path','d:\data_seq\freeman3\','startFrame',1,'endFrame',460,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','freeman4','path','D:\workspace\rl\DRLT\OTB100\OTB100\Freeman4\img\','startFrame',1,'endFrame',283,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','david3','path','d:\data_seq\david3\','startFrame',1,'endFrame',252,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','jumping','path','d:\data_seq\jumping\','startFrame',1,'endFrame',313,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','carScale','path','d:\data_seq\carScale\','startFrame',1,'endFrame',252,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','skiing','path','d:\data_seq\skiing\','startFrame',1,'endFrame',81,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','dog1','path','d:\data_seq\dog1\','startFrame',1,'endFrame',1350,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','suv','path','d:\data_seq\suv\','startFrame',1,'endFrame',945,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','motorRolling','path','d:\data_seq\motorRolling\','startFrame',1,'endFrame',164,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','mountainBike','path','d:\data_seq\mountainBike\','startFrame',1,'endFrame',228,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),... 
%     struct('name','lemming','path','d:\data_seq\lemming\','startFrame',1,'endFrame',1336,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','liquor','path','d:\data_seq\liquor\','startFrame',1,'endFrame',1741,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','woman','path','d:\data_seq\woman\','startFrame',1,'endFrame',597,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','faceocc1','path','d:\data_seq\faceocc1\','startFrame',1,'endFrame',892,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','faceocc2','path','d:\data_seq\faceocc2\','startFrame',1,'endFrame',812,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','basketball','path','d:\data_seq\basketball\','startFrame',1,'endFrame',725,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','football','path','d:\data_seq\football\','startFrame',1,'endFrame',362,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','subway','path','d:\data_seq\subway\','startFrame',1,'endFrame',175,'nz',4,'ext','jpg','init_rect', [0 0 0 0]),...    
%     struct('name','tiger1','path','d:\data_seq\tiger1_c\','startFrame',1,'endFrame',354,'nz',4,'ext','jpg','init_rect', [0,0,0,0]),...
%     struct('name','tiger2','path','d:\data_seq\tiger2_c\','startFrame',1,'endFrame',365,'nz',4,'ext','jpg','init_rect', [0,0,0,0])
    };

seqs=[seqIVT,seqVTD,seqOther];

