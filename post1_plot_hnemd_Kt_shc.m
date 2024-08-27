clear;  close all; font_size=10; 
box_info=load('post-data/appendix_box-length.txt');   %??????
writ_path=['post-matlab-data']; mkdir(writ_path);   % ??????
Nc=250; % 2nd para in 'compute_shc 8 250 2 1000 400' ????????
T=300;    % ?????????
Fe=0.0003;  %?????????

%m=1;
%job=rho2.25-0.25_y
colo={[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330], [0.6350 0.0780 0.1840], [1 0 0], [0 1 0], [0 0 1], [0 1 1], [1 0 1], [1 1 0],[0 0 0]};
for i=[1.5 2 2.5 3 3.5]    % rho ？？？？
    figure;
    subplot(1, 2, 1);
    for j=1:1:12
        for k=3   % z direction
            dest_file=['job_rho',num2str(i),'_c',num2str(j),'/shc.out'];
            shc=load(dest_file);
            Nt=Nc*2-1;
            time_in_ps=shc(1:Nt,1); % correlation time t (ps)
            rows = box_info(:,1) == i & box_info(:,2) == j; % 找出符合条件的行
            %index=setdiff(1:3,k);  % 得到垂直z方向的两个晶格常数
            %tran_a1=box_info(rows,index(1)+2);     % transverse box length to flux direction
            %tran_a2=box_info(rows,index(2)+2);
            tran_a3=box_info(rows,2+k); % assume z direction ?????????????
            K=sum(shc(1:Nt,2:3),2)/tran_a3; % Eq. (18) in Ref. [1] divided by length (eV/ps)in Ref. [1]:  Z. Fan et al., PRB 99, 064308 (2019)
            plot(time_in_ps,K,'-','color',colo{j},'linewidth',2);hold on;
        end

    end
    xlabel('Correlation time (ps)','fontsize', font_size);
    ylabel('K (eV/ps)','fontsize', font_size);
    titl_stri=['(a) \rho = ',num2str(i),' g/cc'];
    title(titl_stri);
    axis tight;
    set(gca,'linewidth',2,'fontsize',font_size+3);

    
    subplot(1, 2, 2);
    kw_clas_coll=[];
    kw_quan_coll=[];
    kapp_clas_coll=[];
    kapp_quan_coll=[];
    for j=1:1:12
        for k=3
            dest_file=['job_rho',num2str(i),'_c',num2str(j),'/shc.out'];
            shc=load(dest_file);
            Nt=Nc*2-1;
            J=sum(shc(Nt+1:end,2:3),2);
            rows = box_info(:,1) == i & box_info(:,2) == j; % 找出符合条件的行
            tran_a1=box_info(rows,3);     
            tran_a2=box_info(rows,4); 
            tran_a3=box_info(rows,5); 
            V=tran_a1*tran_a2*tran_a3;   % A^3
            kapp=1.6e3*J/V/T/Fe;
            nu=shc(Nt+1:end,1)/2/pi; % frequency (THz)
            hnu = 6.63e-34*nu*1.e12;
            kBT = 1.38e-23*T;
            x = hnu/kBT;
            f = x.*x.*exp(x)./(exp(x)-1).^2;
            p1=plot(nu, kapp, '-','color',colo{j},'linewidth',2);hold on;
            p2=plot(nu, kapp.*f, '--','color',colo{j},'linewidth',2); hold on;
            
            kw_clas_coll=[kw_clas_coll,kapp];
            kw_quan_coll=[kw_quan_coll,kapp.*f];
            kapp_clas = trapz(nu,kapp);
            kapp_clas_coll=[kapp_clas_coll, kapp_clas];
            kapp_quan = trapz(nu,kapp.*f);
            kapp_quan_coll=[kapp_quan_coll, kapp_quan];
        end
    end
    xlabel('\omega/2\pi (THz)','fontsize',font_size);
    ylabel('\kappa(\omega) (W/m/K/THz)','fontsize',font_size);
    legend([p1,p2],{'Classical','Corrected'});
    xlim([0,53]);
    titl_stri=['(b) \rho = ',num2str(i),' g/cc'];
    title(titl_stri);
    axis tight;
    set(gca,'linewidth',2,'fontsize',font_size+3);
    
    figu_name=['hnemd_Kt_kw_',num2str(i),'.png'];
    print([writ_path,'/',figu_name], '-dpng','-r150');
    
    save([writ_path,'/nu.txt'],'nu','-ascii');
    save([writ_path,'/kw_clas_coll_',num2str(i),'.txt'],'kw_clas_coll','-ascii'); 
    save([writ_path,'/kw_quan_coll_',num2str(i),'.txt'],'kw_quan_coll','-ascii'); 
    save([writ_path,'/kapp_clas_coll_',num2str(i),'.txt'],'kapp_clas_coll','-ascii');  
    save([writ_path,'/kapp_quan_coll_',num2str(i),'.txt'],'kapp_quan_coll','-ascii'); 
end