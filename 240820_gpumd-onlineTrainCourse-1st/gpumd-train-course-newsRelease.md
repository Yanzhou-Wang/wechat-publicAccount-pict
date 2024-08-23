## 第一期线上 GPUMD 培训：GPUMD 和 NEP 的理论基础与输入输出的全面剖析

**GPUMD**是一款由渤海大学教授樊哲勇主导开发与维护的**高效国产分子动力学模拟软件**。该软件于**2017**年首发公开**1.0**版本[Computer Physics Communications 218, 10 (2017)](https://doi.org/10.1016/j.cpc.2017.05.003)，目前已迭代至**3.9.5**版本。**GPUMD**中既包含常用的经验势，也包含**NEP（neuroevolution potential）机器学习势**。**NEP**机器学习势从**2021**年提出 [Physical Review B 104, 104309 (2021)](https://doi.org/10.1103/PhysRevB.104.104309) 以来，以其卓越的计算速度和训练精度迅速吸引了大量的科研工作者，在材料的结构、力学、热学、输运、光谱、相变、生长、辐照、催化等领域的模拟中得到了广泛的应用。近年来，**GPUMD**软件的使用量迅速增长，**大有追赶LAMMPS之趋势**（图1）。

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig1.png?raw=true"  width="400">
    <figcaption> 图1：LAMMPS和GPUMD的年引用量趋势图 </figcaption>
    </div>
</figure>

近年来，世界各地的知名研究团队使用**GPUMD**完成了非常出色的工作，例如：

- **2021**年，韩国和瑞典团队使用**GPUMD**研究多层随机堆叠二硫化钼各向异性热导率，发表在**Nature**（图2）。
- **2021**年美国和中国（渤海大学）团队使用**GPUMD**研究碳纳米管热导率，发表在**Physical Review Letters**（图3）。
- **2023**年中国（北京科技大学、渤海大学）与芬兰团队将**NEP**与ZBL结合，使用**GPUMD**研究钨的初级辐照损伤，发表在**Physical Review B**（图4）。
- **2023**年中国（南京大学）团队使用**GPUMD**&**NEP**研究冲击压缩导致的相变，发表在 **Physical Review Letters**（图5）。
- **2023**年中国（南京大学）团队使用**GPUMD**&**NEP**研究行星天体物理学，发表在 **Nature Communications**（图6）。
- **2024**年，中国（南京航空航天大学）团队使用**GPUMD**&**NEP**研究二维材料的断裂韧性，发表在**Journal of the Mechanics and Physics of Solids**（
  图7）。
- **2024**年中国（浙江大学、渤海大学）与瑞典团队开发张量版**NEP**方法，用**GPUMD**研究红外和拉曼光谱，发表在 **Journal of Chemical Theory and Computation**（图8）。 
- **2024**年瑞典团队使用**GPUMD**&**NEP**研究极化化学，发表在**Journal of the American Chemical Society**（图9）。
- **2024**年瑞典团队使用**GPUMD**&**NEP**研究二维钙钛矿材料的相变与动力学性质，发表在**ACS Energy Letters**（图10）。 
- **2024**年美国团队使用**GPUMD**&**NEP**研究高熵合金催化，发表在**Langmuir**（图11）。

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig2.png?raw=true"  width="400">
    <figcaption> 图2：使用GPUMD研究多层随机堆叠二硫化钼各向异性热导率 [Nature 597, 660 (2021)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig3.png?raw=true"  width="400">
    <figcaption> 图3：使用GPUMD研究碳纳米管的热导率 [Phys. Rev. Lett. 127, 025902 (2021)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig4.png?raw=true"  width="400">
    <figcaption> 图4：使用GPUMD&NEP研究钨的初级辐照损伤 [Phys. Rev. B 108, 054312 (2023)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig5.png?raw=true"  width="400">
    <figcaption> 图5：使用GPUM&NEP研究冲击压缩导致的相变 [Phys. Rev. Lett. 131, 146101 (2023)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig6.png?raw=true"  width="400">
    <figcaption> 图6：使用GPUM&NEP研究行星天体物理学 [Nature Communications, 14, 1165 (2023)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig7.png?raw=true"  width="400">
    <figcaption> 图7： 使用GPUMD&NEP研究二维材料的断裂韧性 [Journal of the Mechanics and Physics of Solids, 186, 105579 (2024)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig8.png?raw=true"  width="400">
    <figcaption> 图8：使用GPUMD&NEP研究红外和拉曼光谱 [J. Chem. Theory Comput. 20, 3273 (2024)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig9.png?raw=true"  width="400">
    <figcaption> 图9：使用GPUMD&NEP研究极化化学 [ J. Am. Chem. Soc. 146, 5402 (2024)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig10.png?raw=true"  width="400">
    <figcaption> 图10：使用GPUMD&NEP研究二维钙钛矿材料的相变与动力学性质 
[ACS Energy Lett. 9, 3947 (2024)] </figcaption>
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/fig11.png?raw=true"  width="400">
    <figcaption> 图11： 使用GPUMD&NEP研究高熵合金催化 [Langmuir 40, 3691 (2024)] </figcaption>
    </div>
</figure>

为帮助相关领域的科研工作者了解与使用**GPUMD**软件，**GPUMD**研发团队将开展一系列由浅入深、分门别类的科研培训活动。通过参加一个或多个培训课程，学员将学到大量分子动力学模拟与机器学习势函数的理论知识与应用技能，从而可以更加顺利地开展相关领域的研究工作。本次培训为**GPUMD**团队的第一期线上培训，主题是《**GPUMD**和**NEP**的理论基础与输入输出的全面剖析》。今后将以本次培训为基础，开展若干针对专业领域的专题培训。本次培训课由樊教授主讲，并由徐克与应鹏华博士配合讲解一些软件工具的安装与使用。本次培训将是樊教授首次公开地全面介绍**GPUMD**和**NEP**的各种理论与技术细节。

### 一、培训时间

2024年**9月21-22日两天**（上午9点至12点；下午14点至17点；另有约1小时集中答疑）

### 二、培训方式与地点

本次培训采用**腾讯会议直播**的方式，请扫码缴费，填写报名登记信息后，加培训微信群获取会议等相关信息。

### 三、培训内容与课程安排

1. **NEP**势函数与**GPUMD**分子动力学基础知识（第一天）
   
   1. **NEP**机器学习势函数的基础知识（**樊哲勇**；1小时）
   2. **NEP** 训练的输入输出全面讲解（**樊哲勇**；2小时）
   3. 分子动力学模拟中的积分算法与统计系综（**樊哲勇**；1小时）
   4. **GPUMD**分子动力学模拟的输入输出全面讲解（**樊哲勇**；2小时）
   5. 集中答疑（约1小时）

2. **GPUMD**&**NEP**相关软件的安装与经典案例分析（第二天）
   
   1. 从**CUDA**环境安装开始展示**GPUMD**安装过程（**徐克**；1小时）
   2. **GPUMD** 前后处理软件的安装与使用（**应鹏华**；**Python**、**ASE**、**calorine**）（2小时）
   3. 典型体系的NEP模型训练与结果分析（樊哲勇；1小时）
   4. 基于典型NEP模型的分子动力学模拟（樊哲勇；2小时）
   5. 集中答疑（约1小时）

### 四、培训师资

   **樊哲勇**教授：2010年于南京大学获理学博士学位，后在厦门大学与芬兰Aalto大学做博士后研究，现为渤海大学教授。主导开发了**GPUMD**程序与**NEP**机器学习势。共发表论文100余篇，其中高被引论文6篇，论文总引用近4000次，H因子35。在**Physics Reports** （5年影响因子：25.7）以第一作者发表题为“**Linear Scaling Quantum Transport Methodologies**”的长篇综述论文。出版《**CUDA** 编程：基础与实践》（清华大学出版社）一书，已被重印多次，并被选为英伟达社区权威参考教材。即将出版《分子动力学模拟》（化学工业出版社）一书。主持国家自然科学基金两项。入选美国斯坦福大学发布的2023年度“全球前2%顶尖科学家榜单”。

   **徐克**博士：2023年于厦门大学获物理学博士学位。现任香港中文大学博士后。分别在2017年和2021年开始使用**GPUMD**和**NEP**，研究体系包括二维材料、非晶结构、固态电解质以及液态水等。目前已在著名期刊Physical Review B、The Journal of Chemical Physics、Nanoscale、Applied Physics Letters、Journal of Molecular Liquids等发表一作文章13篇，合作文章30余篇，谷歌学术引用近1000次，H因子16。主要研究方向为使用**NEP**开发机器学习势，结合**GPUMD**探究材料的物理、化学性质。

   **应鹏华**博士：2022年于哈尔滨工业大学（深圳）获力学博士学位。现受以色列高等教育委员会和以色列科学院杰出国际博士后奖学金资助，在特拉维夫大学（Tel Aviv University）物理化学系任博士后研究员。近年来，采用**NEP**等机器学习势结合分子动力学对层状材料表面和界面的力化学耦合行为展开研究，相关工作以第一作者或通讯作者发表于ACS Nano、Nano Letters、Composite Structure and Science、Extreme Mechanics Letters、ACS Applied Materials & Interface、Carbon、Materials Today Physics等同行评审期刊。

### 五、培训收费

| 类别                 | 公费价格    | 自费价格    |
| ------------------ | ------- | ------- |
| 单人价                | 1500元/人 | 1200元/人 |
| 早鸟价（9月1日前）         | 1300元/人 | 1000元/人 |
| 团报价（5人及以上）         | 1200元/人 | 900元/人  |
| 团报早鸟价（9月1日前，5人及以上） | 1000元/人 | 800元/人  |

### 六、缴费方式 (可以开发票)

1. 请将报名费通过银行汇款至培训举办单位账户：
   
   **开户名称：智演科技（锦州）有限公司**
   
   **开户银行：中国建设银行股份有限公司锦州桥东支行**
   
   **账号：21050167930000000554**    
   
   **统一社会信用代码：91210700MADR9L8F50**
   
   请务必在汇款后附言：**GPUMD培训班+姓名**，并保存汇款凭证，以便及时确认您的汇款。

2. 可直接用微信、支付宝、云闪付扫描下面收款码支付，请在支付时添加备注：**GPUMD培训班+姓名**，并截图保存支付记录，以便及时确认您的汇款。

3. 汇款成功后请用微信扫描下面的报名登记码填写学员报名信息。

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/qr1.png?raw=true"  width="400">
    </div>
</figure>

<figure>
    <div style="text-align: center;">
    <img src="https://github.com/Yanzhou-Wang/wechat-publicAccount-pict/blob/main/240820_gpumd-onlineTrainCourse-1st/qr2.png?raw=true"  width="400">
    </div>
</figure>

---

> **供稿**: 董海宽 || **小编**: 王彦周 || **主编**: 董海宽