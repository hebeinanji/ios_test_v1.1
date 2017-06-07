//
//  TermsServiceViewController.m
//  NativeMeal
//
//  Created by 孙烁鑫 on 17/5/20.
//  Copyright © 2017年 sunsx. All rights reserved.
//

#import "TermsServiceViewController.h"


@interface TermsServiceViewController ()

@end

@implementation TermsServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView * view1 = [[UIScrollView alloc]initWithFrame:CGRectMake(INDEX, INDEX, UISCREEN_WIDTH - 2*INDEX, UISCREEN_HEIHT)];
    view1.contentSize = CGSizeMake(0, UISCREEN_WIDTH *6);
    [self.view addSubview:view1];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(INDEX/2, INDEX, view1.bounds.size.width,view1.bounds.size.height)];
    [label setTextIsAutomaticHeight:@"<<家行天下旅游服务条款>>\n\n1.家行天下旅游服务条款的确认\n家行天下旅游的所有权与运作权归家行天下网络科技股份有限公司（以下简称家行天下）所有。本服务条款具有法律约束力。一旦您点选 注册并通过注册程序，即表示您自愿接受本协议之所有条款，并已成为家行天下旅游的注册会员\n2.服务内容\n2.1 家行天下旅游服务的具体内容由家行天下根据实际情况提供.\n2.2 家行天下在家行天下旅游上向其会员提供相关网络服务,与相关网络服务有关的设备（如个人电脑、手机、及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费）均由会员自行负担。\n3．会员帐号及密码\n3.1您注册会员成功后，将得到一个帐号和密码。您应妥善保管该帐号及密码，并对以该帐号进行的所有活动及事件负法律责任。因黑客行为或会员保管疏忽致使帐号、密码被他人非法使用的，家行天下不承担任何责任。如您发现任何非法使用会员帐号或安全漏洞的情况，请立即与家行天下联系.\n 3.2 用户在申请使用家行天下旅游网络服务时，必须向家行天下旅游提供准确的个人资料，如 个人资料有任何变动，必须及时更新。\n3.4 会员在家行天下旅游的网页上发布信息或者利用家行天下旅游的服务时必须符合国家的法律法规以及国际法的有关规定。\n3.5 会员承诺不会在家行天下旅游的消息平台（包括但不限于论坛、BBS、评论）发布如下信息：\n    反对宪法所确定的基本原则的；\n    危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；\n    损害国家荣誉和利益的；\n    煽动民族仇恨、民族歧视，破坏民族团结的；\n    破坏国家宗教政策，宣扬邪教和封建迷信的；\n    散布谣言，扰乱社会秩序，破坏社会稳定的；\n     散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；\n    侮辱或者诽谤他人，侵害他人合法权益的；\n     含有法律、行政法规禁止的其他内容的。\n  3.6 会员不得利用本站的服务从事以下活动：\n    未经允许，进入计算机信息网络或者使用计算机信息网络资源；\n    未经允许，对计算机信息网络功能进行删除、修改或者增加；\n    未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加；\n  故意制作、传播计算机病毒等破坏性程序；\n   其他危害计算机信息网络安全的行为。\n   3.7 如果会员违反上述规定，家行天下有权要求其改正或直接采取一切必要措施（包括但不限于更改或删除会员发布的信息、中断或终止会员使用网络的权利等），以减轻会员不当行为所造成的影响。\n   4．会员隐私保护\n    家行天下尊重会员的隐私权，不会公开、编辑或泄露任何有关会员的个人资料以及会员在使用网络服务时存储在家行天下旅游的非公开内容，但以下情况除外\n  事先获得会员的明确授权；遵守法律规定或家行天下旅游合法服务程序；\n    按照相关政府主管部门的合理要求；\n  维护社会公众利益；\n    维护家行天下的合法权益；\n   符合其他合法要求。\n  5．免责声明\n  5.1 家行天下对任何因会员不正当或非法使用服务、在网上进行交易、或会员传送信息变动而产生的直接、间接、偶然、特殊及后续的损害不承担责任。\n  5.2 家行天下对任何他人的威胁性的、诽谤性的、淫秽的、令人反感的或非法的内容或行为或对他人权利的侵犯（包括知识产权）不承担责任；并对任何第三方通过服务发送或在服务中包含的任何内容不承担责任。\n   5.3 会员明确同意其使用家行天下旅游服务所存在的风险以及使用家行天下旅游服务产生的一切后果由其自己承担。\n  5.4 对于因不可抗力或家行天下旅游不能控制的原因造成的网络服务中断或其它缺陷，家行天下旅游不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。\n  5.5 家行天下不对所提供之网络服务做任何类型之担保，包括但不限于：\n    网络服务一定能满足会员要求；\n    网络服务不会中断；\n     网络服务的及时性、安全性、准确性。\n    但是家行天下对不违反规定的特定目的担保不作限制。\n  6．赔偿\n    因会员对本服务之使用而导致家行天下遭受任何来自第三方之纠纷、诉讼及索赔要求，会员同意向家行天下及其关联企业、职员赔偿相应损失（包括合理的律师费），并尽力使之免受损害。\7．通告\n    所有发给会员的通告都可以通过重要页面的公告、电子邮件以及常规信件的形式传送。\n  8．法律\n    家行天下服务条款之效力、解释、执行均适用中华人民共和国法律。如发生争议，应提交至有管辖权之人民法院。\n  9．其他规定\n    本服务条款中的标题仅为方便而设，在解释本服务条款时应被忽略。"];
    [view1 addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
