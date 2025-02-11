import { SlidingTabController, SlidingTabsV2 } from "@xqw/sliding-tabs";

@Entry
@ComponentV2
export  struct  Index{
  private listScroller: ListScroller = new ListScroller()
  @Local scrollTabs: Array<string> = ['全部','资讯','资料']
  private tabController = new SlidingTabController()
  @Local list:string[]=new Array(20).fill('嗯，用户问的是“奇门遁甲 帝衰代表什么意思”。首先，我需要确定“帝衰”在奇门遁甲中的具体含义。根据搜索结果，帝衰可能指的是“帝旺”与“衰”这两个状态，属于十天干生旺死绝表中的十二种状态之一。\n' +
    '\n' +
    '在网页3和网页10中，提到了十天干的十二种状态，包括长生、沐浴、冠带、临官、帝旺、衰、病、死、墓、绝、胎、养。帝旺代表极盛时期，而衰则是从顶峰开始下滑的阶段。比如网页3提到，帝旺是“荣发、发达，得意、精神、兴奋”，而衰则是“无力、衰弱、福小、倒霉”等。网页10也详细解释了这些状态对预测的影响，比如日干处于帝旺可能表示当前顺利，但未来可能下滑；而衰则预示压力和无能为力。\n' +
    '\n' +
    '接下来，需要结合奇门遁甲中符号的旺衰来判断事物的吉凶。例如，网页8和网页10指出，符号的旺衰直接影响其吉凶含义。例如，天任星旺相时代表诚实守信，衰弱时则变为固执任性。同样，玄武在旺相时可能代表聪明，衰弱时则可能表现为糊涂。\n' +
    '\n' +
    '另外，网页10提到预测婚姻时，乙庚相生但旺衰不同会影响结果。如果乙奇衰弱，即使庚生乙，女方也可能不接受男方。这说明旺衰状态在具体应用中的重要性。\n' +
    '\n' +
    '综合来看，“帝衰”应指天干在帝旺和衰的状态，帝旺象征极盛，衰则象征衰退。在奇门遁甲中，这两个状态用于判断符号的能量强弱，进而影响预测结果。需要引用多个网页的信息，如网页3、网页8、网页10等，来支持解释。')
  aboutToAppear(): void {
  }
  build() {
    Column() {
      SlidingTabsV2({
        tabs: this.scrollTabs,
        barMode: "scroll",
        barHeight: 40,
        tabController: this.tabController,
        tabStyle: {
          fontColor: 'black',
          fontWeightSelect: FontWeight.Bold
        },
        indicatorStyle: {
          wrapTab: false,
          width: 16,
          height: 3,
          margin: 0,
          radius: 3,
          color: 'red',

        },
        onChange: (index) => {

        }
      })
      Swiper(this.tabController.swiperController) {
        ForEach(this.scrollTabs, () => {
          Stack({ alignContent: Alignment.TopStart }) {
            Column() {
                List({
                  space:30,
                  scroller: this.listScroller
                }) {
                  ForEach(this.list, (str:string) => {
                      ListItem(){
                        Row() {
                          Text(str).fontSize(14)
                            .fontColor(Color.Orange)
                        }.width('100%')
                        .backgroundColor(Color.Blue)
                      }
                  })
                }.divider({
                  color:'#eee',
                  strokeWidth:.5,
                })
                .scrollBar(BarState.Off)
                .onDidScroll(() => {
                  console.log('解析++++++',this.listScroller.currentOffset().yOffset)
                })
                .edgeEffect(EdgeEffect.None)

                .layoutWeight(1)
                .width('100%')
              }.padding(16)
            }

          .width('100%')

          .layoutWeight(1)
        }, (item: string) => item)
      }
      .vertical(false)
      .layoutWeight(1)
      .loop(false)
      .indicator(false)
      .onGestureSwipe((index, extraInfo) => {
        this.tabController.swiperOnGestureSwipe(index, extraInfo)
      })
      .onAreaChange((oldValue, newValue) => {
        this.tabController.swiperOnAreaChange(oldValue, newValue)
      })
      .onAnimationStart((index, targetIndex, extraInfo) => {
        this.tabController.swiperOnAnimationStart(index, targetIndex, extraInfo)
      })
  }
  .height('100%')
  .width('100%')

  }
}