# 使用NEP和rSCAN泛函准确预测水的结构和输运性质

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/fig-abst1.png?raw=true"  width="200">
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/fig-abst2.png?raw=true"  width="400">
    </div>
</figure>

深入理解水的结构和动力学行为在海水淡化、离子分离、电催化和生化过程等各个领域都至关重要。虽然现有的报道表明从头算分子动力学 (ab-initio molecular dynamics， AIMD) 可以准确地描述水的结构，但不论是GGA，metaGGA ，还是混合泛函，都需要额外施加从 30K 到 120K 的人工高温 (artificial high temperature，AHT) 去模拟氢键网络的量子效应。例如PBE+D3模拟室温水（300K，1个大气压）需要用390K，optB88-vdW需要用350K，SCAN（metaGGA）需要330K。

事实上，这种操作不符合逻辑，尤其是对于涉及水的多相混合物体系，例如水-固界面和水溶液，AHT是一种不合适的方法。这是由于其他相中额外的声子被激活，这可能导致对附近水分子动力学行为被高估。其实理解起来很简单，因为热张落～k<sub>B</sub>T，升高温度必然导致系统的热张落被高估。在这项工作中，研究者发现一种SCAN泛函的拓展形式 (regularized SCAN，rSCAN)，可以在没有 AHT 的条件下（即300K）很好地描述液态水的结构和动力学行为。此外，rSCAN 可以重复碱金属、碱土金属和卤素离子水合结构的实验结果。由此说明， rSCAN metaGGA可以成为研究水环境中化学过程的重要工具，尤其是在当前火热的机器学习势领域。相关研究成果以“Ab-initio Simulation of Liquid Water without Artificial High Temperature” 为题，发表在理论与计算化学领域TOP期刊[《Journal of Chemical Theory and Computation》](https://doi.org/10.1021/acs.jctc.4c00650 "Wang et al")上。第一作者为苏州大学能源学院一年级硕士生王晨宇，通讯作者为周柯副教授。

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/fig1.png?raw=true"  width="400">
    <figcaption> 图-1. 一定温度下PBE+D3、optB88-vdW、SCAN和rSCAN计算得到的(a)氧-氧径向分布函数g<sub>O-O</sub>(r)和(b)氧-氢径向分布函数g<sub>O-H</sub>(r)与先进多体水模型MB-pol和实验数据的对比。 </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/table1.png?raw=true"  width="400">
    <figcaption> 表-1. 不同方法下氧-氧径向分布函数g<sub>O-O</sub>(r)的结构性质与实验值的对比。 </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/fig2.png?raw=true"  width="400">
    <figcaption> 图-2. (a) 300 K时液态水的振动态密度(VDOS)与CCSD(T)的结果比较。(b) 分子间平移和旋转运动的低频振动谱。 </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/fig3.png?raw=true"  width="400">
    <figcaption> 图-3. (a) 不同方法计算得到的MSD曲线(1024个水分子体系的计算结果）；(b) 采用Green-Kubo公式计算的粘度系数与相关时间的关系。(c) 计算所得的扩散系数和粘度系数同实验结果的对比。 </figcaption>
    </div>
</figure>

此工作中，作者利用PBE+D3，optB88-vdW，SCAN和rSCAN的DFT计算结果，训练了4套NEP势，由此可以利用GPUMD计算大体系下的结果，并且大大加长模拟时长。通过计算液态水的振动态密度(VDOS，1024水分子体系计算得到；计算细节可以查看[GPUMD官网](https://gpumd.org/tutorials/density\_of\_states.html "DOS计算")，发现rSCAN非常接近CCSD(T)的结果，并且相较于其他方法，rSCAN可以很好地描述水分子间的平移和旋转模态。此外，本工作利用了GPUMD自带的自扩散和粘度系数计算功能(compute\_msd和compute\_viscosity)。需要注意的是，MD模拟计算的自扩散系数受有限尺寸效应的影响，需要通过计算一系列不同尺寸的体系外推得到无穷大尺寸的结果。这种计算往往无法通过AIMD直接计算，因为计算量巨大，而对于基于NEP的GPUMD来说，计算消耗极小。

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240902_water-kappa/fig4.png?raw=true"  width="400">
    <figcaption> 图-4. PIMD计算得到的径向分布函数。图中同时标出了AIMD以及实验结果。 </figcaption>
    </div>
</figure>

值得注意的是，此工作中还利用了GPUMD自带的PIMD功能(ensemble pimd)。为了检验NEP势的准确性，作者通过跑较短时间(4000步)的纯DFT的PIMD(即使是短时间，计算量也巨大)，获得能量和力，检验了NEP势能面模型描述PIMD模拟过程的准确性。由此得到量子核下的水的径向分布函数。结果显示，对于g<sub>OH</sub>(r)，PIMD可以几乎完美重复实验结果；量子核相比于经典核更接近实验结果，进一步也说明了H原子的核量子效应显著。

本工作中的NEP训练和GPUMD计算，均是通过单卡4090的台式机计算得到。

> **供稿**: 王晨宇 || **副编**: 王彦周 || **主编**: 董海宽
