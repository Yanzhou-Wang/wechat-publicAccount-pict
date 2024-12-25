
# 动态过渡相转变诱导的声子热输运异常抑制和各向异性 

<span style="color:blue">Dynamic mesophase transition induces anomalous suppressed and anisotropic phonon thermal transport, Linfeng Yu, Kexin Dong, Qi Yang, Yi Zhang, Zheyong Fan, Xiong Zheng, Huimin Wang\*, Zhenzhen Qin, and Guangzhao Qin\*,<i>npj Computational Materials</i> <b>10</b>, 280 (2024)</span>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/241225-1_HuNan-YuLF_npjcm/Aspose.Words.26df3f8e-00c3-47bf-948c-8a0d884cf75c.001.png?raw=true" width="400">
    </div>
</figure>

## 动态过渡相转变诱导的声子热输运异常抑制和各向异性——基于GPUMD与NEP机器学习势函数的研究

物质在相变过程中，物理和化学性质会发生显著变化。然而，由于缺乏动态视角并且第一性原理计算资源需求较高，过渡中间相（即相变过程中两种稳定相态之间的过渡阶段）尚未得到充分研究。为解决这一问题，湖南大学秦光照与湘潭大学王慧敏团队提出了一种创新方法，结合机器学习技术和分子动力学模拟，揭示了过渡中间相对材料热输运性质的影响。该研究工作主要基于GPUMD分子动力学模拟与NEP机器学习势函数完成。

本研究的创新之处在于，利用机器学习拟合原子间势函数技术，结合基于GPU框架的分子动力学模拟（GPUMD）方法，成功模拟了二维碳材料Janus-graphene在单轴应变下的相变过程。通过该方法，研究团队高效地实现了高精度的原子级模拟，揭示了相变点附近过渡中间相对热导率的显著抑制作用，以及由此引发的强烈各向异性变化。尤其值得关注的是，热振动诱导的中间无定形相或界面相显著增强了界面热阻，从而对材料的热传导性能产生深远影响。

此外，研究团队提出了一种结合主动学习与最远点采样（FPS）算法的训练集构建方法，进一步优化了机器学习势函数的训练过程。该策略能够有效筛选最具代表性的样本进行训练，减少冗余数据，提高预测精度。这一方法不仅对材料热性能的预测具有重要应用价值，同时也为分子模拟领域提供了新的技术路径，特别是在处理大规模复杂数据集时，能够显著提升计算效率与精度。

在模拟过程中，GPUMD技术作为强大的计算平台，通过加速分子动力学模拟显著提升了计算效率。与传统基于经验势的分子动力学方法相比，结合NEP势函数的方法不仅显著降低了计算资源消耗，还大幅提升了模拟精度。NEP势函数通过机器学习技术学习第一性原理方法中的原子间相互作用，能够捕捉复杂物理现象，减少冗余计算数据，从而有效降低势函数的拟合难度和计算负担。

这项研究为相变过程中中间相的研究提供了新的视角，也为热导率调控和材料设计开辟了新的思路。通过将机器学习与分子动力学结合，研究团队展示了如何通过调节过渡中间相来调控材料的热传输性质，为未来的材料设计和分子模拟提供了重要的工具和理论基础。

相关论文近期发布于 [npj Computational Materials 10, 280 (2024)](https://www.nature.com/articles/s41524-024-01442-z "Yu et al.")。

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/241225-1_HuNan-YuLF_npjcm/Aspose.Words.26df3f8e-00c3-47bf-948c-8a0d884cf75c.002.jpeg?raw=true" width="400">
    <figcaption>Figure 1. Strain-induced atomic-level phase diagram.</figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/241225-1_HuNan-YuLF_npjcm/Aspose.Words.26df3f8e-00c3-47bf-948c-8a0d884cf75c.003.png?raw=true" width="400">
    <figcaption>Figure 2. Workflow for the Development of Extended Interatomic Potential Functions.</figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/241225-1_HuNan-YuLF_npjcm/Aspose.Words.26df3f8e-00c3-47bf-948c-8a0d884cf75c.004.png?raw=true" width="400">
    <figcaption>Figure 3. Static physical properties.</figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/241225-1_HuNan-YuLF_npjcm/Aspose.Words.26df3f8e-00c3-47bf-948c-8a0d884cf75c.005.png?raw=true" width="400">
    <figcaption>Figure 4. Thermal transport properties verified by multi-methods.</figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/241225-1_HuNan-YuLF_npjcm/Aspose.Words.26df3f8e-00c3-47bf-948c-8a0d884cf75c.006.png?raw=true" width="400">
    <figcaption>Figure 5. Transition phases and thermal resistance models.</figcaption>
    </div>
</figure>

> 供稿: **余林凤（湖南大学）** || 副编: **王彦周** || 主编: **董海宽**
