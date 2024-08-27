clear; close all;
%=== Assignment ================
time_step=0.5; hnemd_inte=1000;   % interval, first para of 'compute_hnemd 1000 0 0 0.0002'??????????????
Fe=[0 0 1]; % logic, forceDirection applied    %%??????????
colo={[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330], [0.6350 0.0780 0.1840], [1 0 0], [0 1 0], [0 0 1], [0 1 1], [1 0 1], [1 1 0],[0 0 0]};
%================================
fontsize=18; linewidth=2;
%set(gca,'fontsize',16,'ticklength',get(gca,'ticklength')*2,'linewidth',1.8);
writ_dire='post-matlab-data'; mkdir(writ_dire);
figure('position',[100,100,1200,500]); axes;
inde=1;
for rho=[1.5 2 2.5 3 3.5]    % rho range????????????????
    kapp_coll=[];
    subplot(2,3,inde);
    for j=1:12               %cycle times??????????????????????
        kapp=load(['job_rho',num2str(rho),'_c',num2str(j),'/kappa.out']);   % ???
        if Fe(1)==0 & Fe(2)==0 & Fe(3)~=0
            kapp_comp=kapp(:,5);
        elseif Fe(1)==0 & Fe(2)~=0 & Fe(3)==0
            kapp_comp=sum(kapp(:,3:4),2);
        elseif Fe(1)~=0 & Fe(2)==0 & Fe(3)==0
            kapp_comp=sum(kapp(:,1:2),2);
        else
            disp('Wrong assigment of Fe');
        end
        
        n_line=size(kapp,1);
        cumu_time=(1:n_line).*(hnemd_inte*time_step/10^6); % divided by 10^6 means ns
        kapp_cumu=cumsum(kapp_comp)./(1:n_line)';
        plot(cumu_time,kapp_cumu,'linewidth',1.2,'color',[0.5,0.5,0.5]);hold on
        
        kapp_coll=[kapp_coll,kapp_cumu];
        
    end
    mean_kapp=mean(kapp_coll,2);
    p=plot(cumu_time,mean_kapp,'--','color',colo{inde},'linewidth',linewidth+0.5);
    legend(p,[num2str(rho),' g cm^{-3}']);
    xlabel('Time (ns)'); 
    ylabel('\kappa (W m^{-1} K^{-1})');
    %title(['rho=',num2str(rho)]);
    %ylim([0,50]);
    set(gca,'fontsize',fontsize,'ticklength',get(gca,'ticklength')*2,'linewidth',linewidth);
    %set(gca,'xtick',[0:2:6],'ytick',[0:10:50]);
    inde=inde+1;
end
print([writ_dire,'/hnemd-kappa-vs-time.png'],'-dpng','-r300');
