import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance_app2_0/bottom_bar.dart';
import 'package:finance_app2_0/model/news_item.dart';
import 'package:finance_app2_0/pages/description_news_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
      title:
          'Risk of a global recession is minimal, IMF economist says — would take ‘a lot to derail’',
      text:
          'One of the International Monetary Fund’s top economists signals little risk of a global recession, despite the ongoing rumblings of geopolitical uncertainty. The Washington DC-based institute this week nudged its global growth outlook slightly higher to 3.2% in 2024 and projects the same rate in 2025. “When we do the risk assessment around that baseline, the chances that we would have something like a global recession is fairly minimal. At this point, it will take a lot to derail this economy. So there has been tremendous resilience in terms of growth prospects,” Pierre-Olivier Gourinchas, economic counsellor and director of the research department at the IMF, told CNBC’s Karen Tso on Tuesday at the group’s meeting in New York. The “set of good news” includes strong economic performance by the U.S. and several emerging market economies, along with inflation falling faster than expected until recently despite weaker growth in Europe, Gourinchas said. There is divergence within Europe, he added, with the IMF downgrading its growth forecasts for Germany, France and Italy, but taking them higher for Spain, Portugal, Belgium and the U.K. Growth forecasts since fall last year have had to factor in increased geopolitical instability, with tensions in the Middle East looming over the oil market, while Israel’s war with Palestinian militant group Hamas in the Gaza Strip led to disruptions in shipping routes in the Red Sea, by way of maritime attacks from Yemeni Houthis. That has all combined with the ongoing Russia-Ukraine war, which had its biggest wider impact on energy prices in Europe in 2022.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107402341-1713350869132-gettyimages-2104430185-20240322-55610.jpeg?v=1713350935&w=1260&h=630&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'UK inflation eases less than expected to 3.2% in March, sparking concerns of U.S.-style stickiness',
      text:
          'Inflation in the U.K. eased to 3.2% from 3.4% in March, the Office for National Statistics said on Wednesday, but a set of higher-than-expected figures spurred investors to push back bets on the timing of the first Bank of England rate cut. Economists polled by Reuters had expected a reading of 3.1%. Food prices provided the biggest downward drag on the headline rate, the ONS said, while motor fuels pushed it higher. The core figure, excluding energy, food, alcohol and tobacco, came in at 4.2%, compared with a projection of 4.1%. Services inflation, a key watcher for U.K. monetary policymakers, declined from 6.1% to 6% — again above the expectations of both economists and the BOE. This week, investors have been monitoring signs of a cooling U.K. labor market, with unemployment unexpectedly rising to 4.2% in the period between December and February. Wage growth excluding bonuses meanwhile dipped from 6.1% in January to 6% in February. BOE Governor Andrew Bailey on Tuesday said he saw “strong evidence” that higher interest rates were working to tame the rate of price rises, which has cooled from a peak of 11.1% in October 2022. The central bank’s own forecast is for inflation to “briefly drop” to its 2% target in the spring before increasing slightly.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107402256-1713331543251-gettyimages-2147845772-UK_EMPLOYMENT.jpeg?v=1713331555&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'IMF upgrades global growth forecast as economy proves ‘surprisingly resilient’ despite downside risks',
      text:
          'The International Monetary Fund on Tuesday slightly raised its global growth forecast, saying the economy had proven “surprisingly resilient” despite inflationary pressures and monetary policy shifts. The IMF now expects global growth of 3.2% in 2024, up by a modest 0.1 percentage point from its earlier January forecast, and in line with the growth projection for 2023. Growth is then expected to expand at the same pace of 3.2% in 2025. The IMF’s chief economist, Pierre-Olivier Gourinchas, said the findings suggest that the global economy is heading for a “soft landing,” following a string of economic crises, and that the risks to the outlook were now broadly balanced. “Despite gloomy predictions, the global economy remains remarkably resilient, with steady growth and inflation slowing almost as quickly as it rose,” he said in a blog post. Growth is set to be led by advanced economies, with the U.S. already exceeding its pre-Covid-19 pandemic trend and with the euro zone showing strong signs of recovery. But dimmer prospects in China and other large emerging market economies could weigh on global trade partners, the report said.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107401739-1713271291754-gettyimages-519464988-000090539233_Unapproved.jpeg?v=1713272579&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title: 'Retail sales jumped 0.7% in March, much higher than expected',
      text:
          'Rising inflation in March didn’t deter consumers, who continued shopping at a more rapid pace than anticipated, the Commerce Department reported Monday. Retail sales increased 0.7% for the month, considerably faster than the Dow Jones consensus forecast for a 0.3% rise though below the upwardly revised 0.9% in February, according to Census Bureau data that is adjusted for seasonality but not for inflation. The consumer price index increased 0.4% in March, the Labor Department reported last week in data that also was higher than the Wall Street outlook. That means consumers more than kept up with the pace of inflation, which ran at a 3.5% annual rate for the month, below the 4% retail sales increase. Excluding auto-related receipts, retail sales jumped 1.1%, also well ahead of the estimate for a 0.5% advance. The core control group, which strips out several volatile measures and is in the formula to determine gross domestic product, also increased 1.1% A rise in gas prices helped push the headline retail sales number higher, with sales up 2.1% on the month at service stations. However, the biggest growth area for the month was online sales, up 2.7%, while miscellaneous retailers saw an increase of 2.1%. Multiple categories did report declines in sales for the month: Sporting goods, hobbies, musical instruments and books posted a 1.8% decrease, while clothing stores were off 1.6%, and electronics and appliances saw a 1.2% drop. Stock market futures added to gains following the report, while Treasury yields also pushed sharply higher. The upbeat outlook for the Wall Street open came despite an escalation over the weekend in Middle East tensions as Iran launched aerial strikes on Israel. Stocks surrendered gains later in the session as yields surged.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107335126-1700155190837-gettyimages-1470785658-img_1456_mkoemqqj.jpeg?v=1700155239&w=600&h=338&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'Surging inflation fears sent markets tumbling and Fed officials scrambling',
      text:
          'The early data is in for the path of inflation during the first three months of 2024, and the news so far is, well, not good. Pick your poison. Whether it’s prices at the register or wholesale input costs, while inflation is off the blistering pace of 2022, it doesn’t appear to be going away anytime soon. Future expectations also have been drifting higher. Investors, consumers and policymakers — even economists — have been caught off guard with just how stubborn price pressures have been to start 2024. Stocks slumped Friday as the Dow Jones Industrial Average coughed up nearly 500 points, dropping 2.4% on the week and surrendering nearly all its gains for the year. “Fool me once, shame on you. Fool me twice, shame on me,” Harvard economist Jason Furman told CNBC this week. “We’ve now had three months in a row of prints coming in above just about what everyone expected. It’s time to change the way we think about things going forward.” No doubt, the market has been forced to change its thinking dramatically. Even import prices, an otherwise minor data point, contributed to the narrative. In March, it posted its biggest increase for a three-month period in about two years. All of it has amounted to a big headache for markets, which sold off through most of the week before really hitting the skids Friday. As if all the bad inflation news wasn’t enough, a Wall Street Journal report Friday indicated that Iran plans to attack Israel in the next two days, adding to the cacophony. Energy prices, which have been a major factor in the past two months’ inflation readings, pushed higher on signs of further geopolitical turmoil.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107400201-1712873066466-gettyimages-2148324040-rent402979_qlj2b5su.jpeg?v=1712873254&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title:
          'UK economy posts 0.1% growth in February in further sign of recession rebound',
      text:
          'LONDON — U.K. gross domestic product rose 0.1% in February, the Office for National Statistics said Friday, providing another sign of a return to sluggish economic growth this year. The month-on-month figure was in line with a projection in a Reuters poll. On an annual basis, GDP was 0.2% lower. The economy contracted in the third and fourth quarters of 2023, putting the U.K. in a technical recession. January recorded light growth, which was revised upward to 0.3% on Friday. Construction output, which boosted growth at the start of the year, fell 1.9% in February. Instead, production output was the biggest contributor to the GDP, rising by 1.1% in February, while growth in the U.K.’s dominant services sector slowed to 0.1% from 0.3%. The reading “all-but confirms the recession ended” last year, Paul Dales, chief U.K. economist at Capital Economics, said in a note. “But while we expect a better economic recovery than most, we doubt it will be strong enough to prevent inflation (and interest rates) from falling much further as appears to be happening in the U.S.,” Dales added. British inflation fell more than expected in March, to a nearly 2½-year low of 3.4%. In the U.S., however, price rises came in higher than forecast at 3.5% this week, pushing back market bets for the start of interest rate cuts from the summer to September.',
      image:
          'https://image.cnbcfm.com/api/v1/image/107400296-1712908378323-gettyimages-2147028401-AFP_34P66FV.jpeg?v=1712909317&w=740&h=416&ffmt=webp&vtcrop=y',
    ),
    NewsItem(
      title: 'Generation Z is unprecedentedly rich',
      text:
          'Generation z is taking over. In the rich world there are at least 250m people born between 1997 and 2012. About half are now in a job. In the average American workplace, the number of Gen Zers (sometimes also known as “Zoomers”) working full-time is about to surpass the number of full-time baby-boomers, those born from 1945 to 1964, whose careers are winding down (see chart 1). Gen Z is also grabbing power: America now has more than 6,000 Zoomer chief executives and 1,000 Zoomer politicians. As the generation becomes more influential, companies, governments and investors need to understand it. Pundits produce a lot of fluff about the cohort. Recent “research” from Frito-Lay, a crisp-maker, finds that Gen Zers have a strong preference for “snacks that leave remnants on their fingers”, such as cheese dust. Yet different generations also display deeper differences in their personalities, in part due to the economic context in which they grow up. Germans who reached adulthood during the high-inflation 1920s came to detest rising prices. Americans who lived through the Depression tended to avoid investing in the stockmarket. Many argue that Gen Z is defined by its anxiety. Such worriers include Jonathan Haidt, a social psychologist at New York University, whose new book, “The Anxious Generation”, is making waves. In some ways, Gen Zers are unusual. Young people today are less likely to form relationships than those of yesteryear. They are more likely to be depressed or say they were assigned the wrong sex at birth. They are less likely to drink, have sex, be in a relationship—indeed to do anything exciting. Americans aged between 15 and 24 spend just 38 minutes a day socialising in person on average, down from almost an hour in the 2000s, according to official data. Mr Haidt lays the blame on smartphones, and the social media they enable.',
      image:
          'https://www.economist.com/cdn-cgi/image/width=834,quality=80,format=auto/content-assets/images/20240420_FND001.jpg',
    ),
    NewsItem(
      title:
          'Why Better Times (and Big Raises) Haven’t Cured the Inflation Hangover',
      text:
          'In western Pennsylvania, halfway through one of those classic hazy March days when the worst of winter has passed, but the bare trees tilting in the wind tell everyone spring is yet to come, Darren Mattern was putting in some extra work. Tucked at a corner table inside a Barnes & Noble cafe in Logan Town Centre, a sprawling exurban shopping complex in Blair County, he tapped away at two laptops. His work PC was open with notes on his clients: local seniors in need of at-home health care and living assistance, whom he serves as a registered nurse. On his sleeker, personal laptop he eyed some coursework for the master’s degree in nursing he’s finishing so he can work as a supervisor soon. Mr. Mattern, warm and steady in demeanor, says the “huge blessing” of things evident in his everyday life at 35 — financial security, a home purchase last year, a baby on the way — weren’t possible until recently. He had warehouse jobs for most of his 20s, making a few dollars above minimum wage (in a state where that’s still \$7.25 an hour), until he took nursing classes in the late 2010s. Shortly after becoming certified, he pushed through long days in a hospital during the height of the Covid pandemic at a salary of \$40,000. Today, he has what he calls “the best nursing job pay-wise I’ve ever had,” at \$85,000.',
      image:
          'https://static01.nyt.com/images/2024/04/08/multimedia/00econ-mood-qtkm/00econ-mood-qtkm-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title: 'Is the Boom-and-Bust Business Cycle Dead?',
      text:
          'For much of modern history, even the richest nations have been subject to big perennial upswings and crashes in commercial activity almost as fixed as the four seasons. Periods of economic growth get overstretched by increased risk-taking. Hiring and investment crest and fall into a contraction as consumer confidence wanes and spending craters. Sales fall, bankruptcies and unemployment rise. Then, in the depths of a recession, debts are settled, panic abates, green shoots appear, and banks begin lending more easily again — fueling a recovery that enables a new upswing. But a brigade of academic economists and prominent voices on Wall Street are asking if the unruly business cycle they learned in school, and witnessed in practice, has fundamentally morphed into a tamer beast. Rick Rieder, who manages about \$3 trillion in assets at the investment firm BlackRock, is one of them. “There is a lot of ink spilled on what type of landing we will see for the U.S. economy,” he wrote in a note to clients last summer — employing the common metaphor for whether the U.S. economy will crash or achieve a “soft landing” of lower inflation, slower growth and mild unemployment. “But one point to keep in mind,” Mr. Rieder continued, “is that satellites don’t land and maybe that is a better analogy for a modern advanced economy” like the United States. In other words, dips in momentum will now happen within a steadier orbit. And there is some evidence that the current spurt of economic growth may have not just months but several years to run, barring an external disruption (what economists call an “exogenous shock”) or a return of high inflation that prompts the Federal Reserve to push the economy into recession.',
      image:
          'https://static01.nyt.com/images/2024/04/13/business/10business-cycle/10business-cycle-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title:
          'TSMC Will Receive \$6.6 Billion to Bolster U.S. Chip Manufacturing',
      text:
          'The Biden administration will award up to \$6.6 billion in grants to Taiwan Semiconductor Manufacturing Company, the leading maker of the most advanced microchips, in a bid to bring some of the most cutting-edge semiconductor technology to the United States. The funds, which come from the bipartisan CHIPS and Science Act, will help support the construction of TSMC’s first major U.S. hub, in Phoenix. The company has already committed to building two plants at the site and will use some of the grant money to build a third factory in Phoenix, U.S. officials said on Sunday. TSMC will also increase its total investments in the United States to more than \$65 billion, up from \$40 billion. Bringing the world’s most sophisticated chip manufacturing to the United States has been a major goal for the Biden administration. TSMC announced that it would now produce two-nanometer chips at the hub, a significant step forward given that the United States currently produces none of the most advanced semiconductors. Federal officials view the investment as vital for building up a reliable domestic supply of semiconductors, the small chips that power everything from phones and supercomputers to cars and fighter jets. Although semiconductors were invented in the United States, production has largely shifted overseas in recent decades. Only about 10 percent of the world’s chips are made in the United States.',
      image:
          'https://static01.nyt.com/images/2024/04/08/multimedia/08dc-TSMC-gqcj/08dc-TSMC-gqcj-superJumbo.jpg?quality=75&auto=webp',
    ),
    NewsItem(
      title: 'Student debt is haunting Americans from graduation to retirement',
      text:
          'Going to college is supposed to be the path to a more prosperous life. But the cost of getting a degree has become a financial albatross, weighing down borrowers from the day they graduate to the day they retire — if retirement is even possible. Student loan debt is a burden that nearly 3 out of 4 American borrowers say has forced them to delay a major life event — whether that’s buying a house, having kids or getting married, according to the latest Gallup Lumina Foundation Cost of College report. “I’ve had to just put all of my dreams aside and focus on surviving day to day,” Jes Evans, 35, told CNN. She earned a master’s in religious studies in 2017, with dreams of teaching at a college. But she couldn’t find any jobs in her field when she graduated and struggled to find jobs in other areas where she lacked experience. Evans, who now works as a director of youth programs and communications at a church north of Pittsburgh, feels trapped by her debt, for which she pays \$940 a month. “It just feels like you’re treading water your whole life … I can’t travel, I couldn’t really have a family because I couldn’t afford it. It’s just a slog.” Evans is far from alone. Dozens of people who responded to a CNN prompt on social media this week said their student debt has hammered their credit score and drained their income. Many who responded said they were nearing retirement age but couldn’t imagine being able to stop working, saying they would take their debt to their grave.',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1151696021.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp',
    ),
    NewsItem(
      title: 'Mortgage rates rise after disappointing March inflation report',
      text:
          'Mortgage rates drifted higher this week, and could increase further, in a sign that America’s affordability crisis isn’t letting up. The 30-year fixed-rate mortgage averaged 6.88% in the week ending April 11, up from 6.82% the previous week, according to Freddie Mac data released Thursday. A year ago, the average 30-year fixed-rate was 6.27%. Rates have mostly held steady in the past several weeks, but they could rise even higher, potentially crossing the uncomfortable psychological threshold of 7%, if inflation proves to be more stubborn than expected. The Federal Reserve doesn’t directly set mortgage rates, but its actions do influence them, and hotter-than-expected inflation readings could keep the central bank from reducing interest rates. “Mortgage rates have been drifting higher for most of the year due to sustained inflation and the reevaluation of the Federal Reserve’s monetary policy path,” said Sam Khater, Freddie Mac’s chief economist, in a release. “While newly released inflation data from March continues to show a trend of very little movement, the financial market’s reaction paints a far different economic picture.” Mortgage rates track the benchmark yield on the 10-year US Treasury note, which moves in anticipation of the Fed’s decisions. The yield topped 4.5% Wednesday, the highest level since November, after the latest Consumer Price Index showed persistent price pressures in March. That doesn’t bode well for lower mortgage rates, and economists don’t expect rates to fall below 6% this year, especially if the Fed does not end up cutting interest rates.',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-2086941806-20240411141619608.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp',
    ),
    NewsItem(
      title:
          'Bad news for Biden (and all Americans): Inflation is creeping higher at the worst time',
      text:
          'There’s rarely a good time for prices to rise a lot. Good luck finding someone who will tell you they enjoy it when their hard-earned dollars can’t stretch as far. But, if you’re President Joe Biden, now is a particularly bad time for inflation to reaccelerate. Just as he was starting to get better marks on the economy after months of negative feedback from voters, inflation soared to the highest level in six months, according to a Bureau of Labor Statistics report issued Wednesday. Prices were up 3.5% for the year in March, a jump from February’s 3.1% annual inflation rate, the Consumer Price Index report showed. Even though the economy’s been performing well by many metrics, Biden’s learning the hard way that good data — no matter how strong — does little to change how people feel about the economy. On the other hand, bad economic data, especially regarding inflation, almost certainly guarantees people aren’t going to be feeling better about the economy. But people don’t need to parse through monthly inflation reports to know prices are up. Just look at any gas station sign or the heating bill for your home — if you can even afford one. Significant progress over the past two years in getting inflation down from multi-decade highs has been of little help to struggling Americans. All that means is the rate of price increases has slowed but the actual prices we’re paying are still higher than they were in prior years.',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/ap24061846735826-20240410195244258.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp',
    ),
    NewsItem(
      title: 'US wholesale inflation heated up again last month',
      text:
          'A key US inflation gauge increased last month at its fastest pace since April 2023, showing that underlying price pressures remain persistent. The Producer Price Index, a closely watched measure of inflation at the wholesale level, rose 2.1% for the 12 months ended in March, up from a 1.6% gain in February, according to Bureau of Labor Statistics data released Thursday. While the increase was below expectations — FactSet consensus estimates had the annual increase at 2.3% — the acceleration in the prices producers pay for goods and services highlights the persistence of inflation, the bumpy path to bring it lower, and supports fears that interest rates will stay higher for longer. PPI captures average price shifts before they reach consumers and serves as a potential signal for the prices consumers ultimately end up paying. “Producer prices were flat to falling throughout 2023; all three months of 2024 have seen a resumed upward trend,” Kurt Rankin, senior economist with PNC Financial Services Group, told CNN in an interview. “We’ve got plenty of upward pressure from the supply side of the economy still to make its way through to consumers over the coming months; and, of course consumer demand has not waned.”',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-2087332013.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp',
    ),
    NewsItem(
      title:
          'Stubbornly high US inflation grew stronger than expected in March',
      text:
          'Surging gas prices and sky-high mortgages and rent sent inflation rising more than expected in March, adding to Americans’ prolonged and painful battle with high costs. That could force the Federal Reserve to keep its punishing rates higher for longer. US consumer prices picked up again last month, vaulting to a 3.5% increase for the 12 months ended in March, according to the latest Consumer Price Index data released Wednesday by the Bureau of Labor Statistics. That’s up considerably from February’s 3.2% rate and marks the highest annual gain in the past six months. Wednesday’s report further highlights that the path to lower inflation remains extremely bumpy — and continue to be a drag on Americans’ hard-earned finances — and that any loosening of monetary policy might not happen soon. President Joe Biden acknowledged Wednesday there is “more to do” to bring down inflation. “Today’s report shows inflation has fallen more than 60% from its peak, but we have more to do to lower costs for hardworking families. Prices are still too high for housing and groceries, even as prices for key household items like milk and eggs are lower than a year ago,” Biden said in a statement. Inflation has been a bane on Biden’s presidency, with voters consistently giving him low marks for his handling of the economy.',
      image:
          'https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-2076705995-20240409201051480.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F6FE),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 65, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [getNews()],
              ),
            )),
          ),
          BottomBar(
            callBack: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget getNews() {
    List<Widget> list = [];
    for (var news in newsList) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => DescriptionNewsPage(
                        news: news,
                      )),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFDFEAF9),
                borderRadius: BorderRadius.circular(8)),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 98,
                    width: 98,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              news.image!,
                            ))),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  news.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Read more',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  color: Color(0xFF5E81FF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }
}
