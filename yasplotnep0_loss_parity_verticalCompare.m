clear; close all;
linewidth=1.8;fontsize=18; point_markersize=25;
colors={'#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabed4'};
write_dire='post-matlab-data';
mkdir(write_dire);

for i=500
    index=1;
    read_dire=['job_',num2str(i)];    % ??????
    loss = load([read_dire,'/loss.out']);
    generation=(1:length(loss))*100;
    figure;
    %figure('Position',[400,250,600,450]);
    %axes('position',[0.15,0.18,0.83,0.8]);
    loglog(generation,loss(:,2:4),'-.','linewidth',linewidth); hold on;
    loglog(generation,loss(:,5:7),':','linewidth',linewidth*3);
    loglog(generation,loss(:,8),'-y',generation,loss(:,9),'-m',generation,loss(:,10),'-b','linewidth',linewidth);
    xlabel('Generation');
    ylabel('Loss');
    legend('Total','L1','L2','RMSE^{e-train}','RMSE^{f-train}','RMSE^{v-train}','RMSE^{e-test}','RMSE^{f-test}','RMSE^{v-test}','location','northeastoutside','numcolumns',1,'fontsize',12);
    set(gca,'fontsize',fontsize,'linewidth', linewidth,'ticklength',get(gca,'ticklength')*3);
    axis tight; axis square;
    grid on;
    pause(2);
    fn=['loss_',num2str(i),'.png'];
    print([write_dire,'/',fn],'-dpng','-r200');
    close;

    if (exist([read_dire,'/energy_train.out'],'file') == 2) && (exist([read_dire,'/force_train.out'],'file') == 2)
        energy = load([read_dire,'/energy_train.out']);
        force = load([read_dire,'/force_train.out']);
        virial = load([read_dire,'/virial_train.out']);
        figure;
        %figure('Position',[400,250,500,500]);
        %axes('position',[0.17,0.165,0.81,0.81]);
        plot(energy(:,2),energy(:,1),'.','markersize',point_markersize,'color',colors{index}); hold on;
        range_broad=max(energy(:,2))-min(energy(:,2));
        upper_limit=max(energy(:,2))+range_broad/8; lower_limit=min(energy(:,2))-range_broad/8;
        line([lower_limit,upper_limit],[lower_limit,upper_limit],'linestyle','--','color',[0 0 0],'linewidth',linewidth);
        note_str=['RMSE_e = ',num2str(round(loss(end,5),3))];
        mae=mean(abs(energy(:,2)-energy(:,1)));
        note_str2=['MAE_e = ',num2str(round(mae,3))];
        text_x=lower_limit+(upper_limit-lower_limit)/15;
        text_y=lower_limit+(upper_limit-lower_limit)*13/15;
        text(text_x,text_y,{note_str,note_str2},'fontsize',fontsize);
        xlabel('DFT energy (eV/atom)');
        ylabel('NEP energy (eV/atom)');
        set(gca,'fontsize',fontsize,'linewidth', linewidth);
        axis tight; axis square;
        grid on;
        pause(2);
        fn=['train-energy_',num2str(i),'.png'];
        print([write_dire,'/',fn],'-dpng','-r200');
        close;

        figure;
        %figure('Position',[400,250,500,500]);
        %axes('position',[0.17,0.165,0.81,0.81]);
        force_dft = reshape(force(:,4:6),size(force,1)*3,1);
        force_nep = reshape(force(:,1:3),size(force,1)*3,1);
        plot(force_dft,force_nep,'.','markersize',point_markersize,'color',colors{index+1}); hold on;
        range_broad=max(force_dft)-min(force_dft);
        upper_limit=max(force_dft)+range_broad/8; lower_limit=min(force_dft)-range_broad/8;
        line([lower_limit,upper_limit],[lower_limit,upper_limit],'linestyle','--','color',[0 0 0],'linewidth',linewidth);
        note_str=['RMSE_f = ',num2str(round(loss(end,6),3))];
        mae=mean(abs(force_dft-force_nep));
        note_str2=['MAE_f = ',num2str(round(mae,3))];
        text_x=lower_limit+(upper_limit-lower_limit)/15;
        text_y=lower_limit+(upper_limit-lower_limit)*13/15;
        text(text_x,text_y,{note_str,note_str2},'fontsize',fontsize);
        xlabel('DFT force (eV/Å)');
        ylabel('NEP force (eV/Å)');
        set(gca,'fontsize',fontsize,'linewidth', linewidth);
        axis tight; axis square;
        grid on;
        pause(2);
        fn=['train-force_',num2str(i),'.png'];
        print([write_dire,'/',fn],'-dpng','-r200');
        close;

        figure;
        %figure('Position',[400,250,500,500]);
        %axes('position',[0.17,0.165,0.81,0.81]);
        virial_nep=reshape(virial(:,1:6),length(virial)*6,1);
        virial_dft=reshape(virial(:,7:12),length(virial)*6,1);
        plot(virial_dft, virial_nep,'.','color',colors{index+2},'markersize',point_markersize); hold on;
        range_broad=max(virial_dft)-min(virial_nep);
        upper_limit=max(virial_dft)+range_broad/8; lower_limit=min(virial_dft)-range_broad/8;
        line([lower_limit,upper_limit],[lower_limit,upper_limit],'linestyle','--','color',[0 0 0],'linewidth',linewidth);
        note_str=['RMSE_v = ',num2str(round(loss(end,7),3))];
        mae=mean(abs(virial_dft-virial_nep));
        note_str2=['MAE_v = ',num2str(round(mae,3))];
        text_x=lower_limit+(upper_limit-lower_limit)/15;
        text_y=lower_limit+(upper_limit-lower_limit)*13/15;
        text(text_x,text_y,{note_str,note_str2},'fontsize',fontsize);
        xlabel('DFT virial (eV/atom)');
        ylabel('NEP virial (eV/atom)');
        set(gca,'fontsize',fontsize,'linewidth', linewidth);
        axis tight; axis square;
        grid on;
        pause(2);
        fn=['train-virial_',num2str(i),'.png'];
        print([write_dire,'/',fn],'-dpng','-r200');
        close;
    else
        disp('energy_train.out and force_train.out are missing ...');
    end


    if (exist([read_dire,'/energy_test.out'],'file') == 2) && (exist([read_dire,'/force_test.out'],'file') == 2)
        energy = load([read_dire,'/energy_test.out']);
        force = load([read_dire,'/force_test.out']);
        virial = load([read_dire,'/virial_test.out']);
        figure;
        %figure('Position',[400,250,500,500]);
        %axes('position',[0.17,0.165,0.81,0.81]);
        plot(energy(:,2),energy(:,1),'.','markersize',point_markersize,'color',colors{index+3}); hold on;
        range_broad=max(energy(:,2))-min(energy(:,2));
        upper_limit=max(energy(:,2))+range_broad/8; lower_limit=min(energy(:,2))-range_broad/8;
        line([lower_limit,upper_limit],[lower_limit,upper_limit],'linestyle','--','color',[0 0 0],'linewidth',linewidth);
        note_str=['RMSE_e = ',num2str(round(loss(end,8),3))];
        mae=mean(abs(energy(:,2)-energy(:,1)));
        note_str2=['MAE_e = ',num2str(round(mae,3))];
        text_x=lower_limit+(upper_limit-lower_limit)/15;
        text_y=lower_limit+(upper_limit-lower_limit)*13/15;
        text(text_x,text_y,{note_str,note_str2},'fontsize',fontsize);
        xlabel('DFT energy (eV/atom)');
        ylabel('NEP energy (eV/atom)');
        set(gca,'fontsize',fontsize,'linewidth', linewidth);
        axis tight; axis square;
        grid on;
        pause(2);
        fn=['test-energy_',num2str(i),'.png'];
        print([write_dire,'/',fn],'-dpng','-r200');
        close;

        figure;
        %figure('Position',[400,250,500,500]);
        %axes('position',[0.17,0.165,0.81,0.81]);
        force_dft = reshape(force(:,4:6),size(force,1)*3,1);
        force_nep = reshape(force(:,1:3),size(force,1)*3,1);
        plot(force_dft,force_nep,'.','markersize',point_markersize,'color',colors{index+4}); hold on;
        range_broad=max(force_dft)-min(force_dft);
        upper_limit=max(force_dft)+range_broad/8; lower_limit=min(force_dft)-range_broad/8;
        line([lower_limit,upper_limit],[lower_limit,upper_limit],'linestyle','--','color',[0 0 0],'linewidth',linewidth);
        note_str=['RMSE_f = ',num2str(round(loss(end,9),3))];
        mae=mean(abs(force_dft-force_nep));
        note_str2=['MAE_f = ',num2str(round(mae,3))];
        text_x=lower_limit+(upper_limit-lower_limit)/15;
        text_y=lower_limit+(upper_limit-lower_limit)*13/15;
        text(text_x,text_y,{note_str,note_str2},'fontsize',fontsize);
        xlabel('DFT force (eV/Å)');
        ylabel('NEP force (eV/Å)');
        set(gca,'fontsize',fontsize,'linewidth', linewidth);
        axis tight; axis square;
        grid on;
        pause(2);
        fn=['test-force_',num2str(i),'.png'];
        print([write_dire,'/',fn],'-dpng','-r200');
        close;

        figure;
        %figure('Position',[400,250,500,500]);
        %axes('position',[0.17,0.165,0.81,0.81]);
        virial_nep=reshape(virial(:,1:6),length(virial)*6,1);
        virial_dft=reshape(virial(:,7:12),length(virial)*6,1);
        plot(virial_dft, virial_nep,'.','color',colors{index+5},'markersize',point_markersize); hold on;
        range_broad=max(virial_dft)-min(virial_nep);
        upper_limit=max(virial_dft)+range_broad/8; lower_limit=min(virial_dft)-range_broad/8;
        line([lower_limit,upper_limit],[lower_limit,upper_limit],'linestyle','--','color',[0 0 0],'linewidth',linewidth);
        note_str=['RMSE_v = ',num2str(round(loss(end,10),3))];
        mae=mean(abs(virial_dft-virial_nep));
        note_str2=['MAE_v = ',num2str(round(mae,3))];
        text_x=lower_limit+(upper_limit-lower_limit)/15;
        text_y=lower_limit+(upper_limit-lower_limit)*13/15;
        text(text_x,text_y,{note_str,note_str2},'fontsize',fontsize);
        xlabel('DFT virial (eV/atom)');
        ylabel('NEP virial (eV/atom)');
        set(gca,'fontsize',fontsize,'linewidth', linewidth);
        axis tight; axis square;
        grid on;
        pause(2);
        fn=['test-virial_',num2str(i),'.png'];
        print([write_dire,'/',fn],'-dpng','-r200');
        close;
    else
        disp('energy_test.out and force_test.out are missing ...')
    end
end