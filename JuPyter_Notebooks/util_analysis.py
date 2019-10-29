def isBadrun(runNum):
    colname=["run"]
    import pandas as pd
    badRunList=pd.read_csv("/users/PCON0003/cond0068/ARA/AraRoot/analysis/ARA_analysis/files/badRuns_list_A3.txt",names=colname)
    return (badRunList["run"]==runNum).any() #True or false

def isUntaggedCalRun(config,runNum):
    import pandas as pd
    badRunList=pd.read_csv("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools/data/A3_c%d_untagged_calpul.csv" % config)
    return (badRunList["Run Number"]==runNum).any() #True or false

def isBadLivetime(station, unixTime):
    BadLivetime=False
    if(station==2):
        if(
            # Livetime flagged as bad by my me
            (unixTime>=1389381600 and unixTime<=1389384000) or # from run 2868
            (unixTime>=1420317600 and unixTime<=1420318200) or # from run 4775
            # (unixTime>=1449189600 and unixTime<=1449190200) or # from run 6507
            (unixTime>=1449187200 and unixTime<=1449196200) or # from run 6507

            #Livetime flagged as bad by my undergrads
            #config 1
            # (unixTime>=1380234000 and unixTime<=1380236400) or # from run 2428 22 hour balloon launch
            # (unixTime>=1382046000 and unixTime<=1382047500) or # from run 2536 22 hour balloon launch
            (unixTime>=1382712900 and unixTime<=1382713500) or # from run 2575
            (unixTime>=1382972700 and unixTime<=1382973300) or # from run 2589
            # (unixTime>=1383689100 and unixTime<=1383690900) or # from run 2631 22 hour balloon launch
            (unixTime>=1383884400 and unixTime<=1383886200) or # from run 2642
            (unixTime>=1384060200 and unixTime<=1384061100) or # from run 2652
            (unixTime>=1384487400 and unixTime<=1384489800) or # from run 2677
            (unixTime>=1384489980 and unixTime<=1384491060) or # from run 2678 at start may be glitch or continued from 2677
            (unixTime>=1384856520 and unixTime<=1384856640) or # from run 2698 super zoomed in two minute window
            # (unixTime>=1385674200 and unixTime<=1385675100) or # from run 2744 22 hour balloon launch
            (unixTime>=1389381600 and unixTime<=1389383700) or # from run 2868 first of two from run 2868
            (unixTime>=1389398700 and unixTime<=1389400200) or # from run 2868 second of two from run 2868
            (unixTime>=1389665100 and unixTime<=1389666300) or # from run 2884
            (unixTime>=1393288800 and unixTime<=1393289400) or # from run 3099
            # (unixTime>=1397856600 and unixTime<=1397858400) or # from run 3442 22 hour balloon launch

            #config 2
            (unixTime>=1376731800 and unixTime<=1376733000) or # from run 2235

            #conifg 3
            (unixTime>=1400276700 and unixTime<=1400277300) or # from run 3605 mainly looks like glitch at end

            #config 4
            (unixTime>=1409986500 and unixTime<=1409988000) or # from run 4184
            # (unixTime>=1412026200 and unixTime<=1412027100) or # from run 4301 22 hr balloon
            # (unixTime>=1412285400 and unixTime<=1412288100) or # from run 4316 weird 22hr balloon
            # (unixTime>=1412544600 and unixTime<=1412545500) or # from run 4331 22hr balloon
            # (unixTime>=1412803800 and unixTime<=1412804700) or # from run 4346 22hr balloon
            (unixTime>=1413898200 and unixTime<=1413899100) or # from run 4408
            (unixTime>=1414083900 and unixTime<=1414086000) or # from run 4418
            (unixTime>=1414350300 and unixTime<=1414351200) or # from run 4434 pt 1
            # (unixTime>=1414358700 and unixTime<=1414359900) or # from run 4434 pt 2 22hr balloon
            (unixTime>=1414674300 and unixTime<=1414674780) or # from run 4452
            (unixTime>=1414986600 and unixTime<=1414987200) or # from run 4471
            (unixTime>=1415223000 and unixTime<=1415223900) or # from run 4483
            (unixTime>=1415380500 and unixTime<=1415381400) or # from run 4493
            (unixTime>=1415558100 and unixTime<=1415559000) or # from run 4503
            (unixTime>=1415742300 and unixTime<=1415743800) or # from run 4513
            (unixTime>=1416207000 and unixTime<=1416212100) or # from run 4541
            (unixTime>=1420978200 and unixTime<=1420978800) or # from run 4814
            (unixTime>=1416905100 and unixTime<=1416910500) or # from run 4579 two spikes about an hour apart
            # (unixTime>=1416950700 and unixTime<=1416951600) or # from run 4582 22 hour balloon launch
            (unixTime>=1417677000 and unixTime<=1417678200) or # from run 4621  weird and cool
            (unixTime>=1417836000 and unixTime<=1417837500) or # from run 4631
            (unixTime>=1420097100 and unixTime<=1420098300) or # from run 4763
            (unixTime>=1420293300 and unixTime<=1420294200) or # from run 4774
            (unixTime>=1420317600 and unixTime<=1420318200) or # from run 4775
            (unixTime>=1420978200 and unixTime<=1420978800) or # from run 4814
            (unixTime>=1421024400 and unixTime<=1421025300) or # from run 4817
            (unixTime>=1421713200 and unixTime<=1421718600) or # from run 4872 looks full of errors and not spiky but could have a spiky
            (unixTime>=1421718000 and unixTime<=1421725800) or # from run 4873 definitely an error but also has spiky boy, part 1 of 2
            (unixTime>=1421733300 and unixTime<=1421733900) or # from run 4873 spiky boy alone but in a run with errors, part 2 of 2
            (unixTime>=1421783400 and unixTime<=1421794200) or # from run 4876 definitely an error but not a spikey boy
            # (unixTime>=1428529800 and unixTime<=1428530700) or # from run 5389 22 hour balloon launch
            (unixTime>=1435623000 and unixTime<=1435623600) or # from run 5801
            # (unixTime>=1436394000 and unixTime<=1436395200) or # from run 5845 22 hour balloon launch
            (unixTime>=1437601200 and unixTime<=1437602700) or # from run 5915 looks like error at the start
            # (unixTime>=1439933700 and unixTime<=1439934960) or # from run 6048 22 hour balloon launch
            (unixTime>=1440581700 and unixTime<=1440582480) or # from run 6086
            # (unixTime>=1441489200 and unixTime<=1441490280) or # from run 6137 22 hour balloon launch
            # (unixTime>=1444685400 and unixTime<=1444687080) or # from run 6322 22 hour balloon launch
            # (unixTime>=1445722020 and unixTime<=1445723220) or # from run 6383 22 hour balloon launch
            (unixTime>=1445934900 and unixTime<=1445935500) or # from run 6396
            (unixTime>=1445960400 and unixTime<=1445961000) or # from run 6397
            # (unixTime>=1445982120 and unixTime<=1445982900) or # from run 6398 22 hour balloon launch
            (unixTime>=1446165600 and unixTime<=1446166200) or # from run 6408
            # (unixTime>=1446327300 and unixTime<=1446328200) or # from run 6418 22 hour balloon launch
            (unixTime>=1446607800 and unixTime<=1446608640) or # from run 6433 looks like an error at end
            (unixTime>=1446784200 and unixTime<=1446784800) or # from run 6445
            # (unixTime>=1476739800 and unixTime<=1476741000) or # from run 8100 22 hour balloon launch
            # (unixTime>=1476999000 and unixTime<=1476999900) or # from run 8114 22 hour balloon launch but barely noticeable
            # (unixTime>=1477258200 and unixTime<=1477259100) or # from run 8129 22 hour balloon launch
            (unixTime>=1477511700 and unixTime<=1477512600) or # from run 8143 weird possible balloon launch
            (unixTime>=1477950300 and unixTime<=1477951500) or # from run 8168 22 hour balloon launch
            # (unixTime>=1478033400 and unixTime<=1478034000) or # from run 8173 22 hour balloon launch
            # (unixTime>=1478295300 and unixTime<=1478296200) or # from run 8188 22 hour balloon launch
            # (unixTime>=1478728500 and unixTime<=1478729400) or # from run 8213 22 hour balloon launch
            (unixTime>=1479231900 and unixTime<=1479232500) or # from run 8241

            # config 5
            (unixTime>=1449280500 and unixTime<=1449281100) or # from run 6513
            (unixTime>=1449610200 and unixTime<=1449612000) or # from run 6531
            (unixTime>=1450536000 and unixTime<=1450537200) or # from run 6584
            # (unixTime>=1450906200 and unixTime<=1450907100) or # from run 6606    22hr
            # (unixTime>=1451423700 and unixTime<=1451424600) or # from run 6635   22hr
            (unixTime>=1452008100 and unixTime<=1452009000) or # from run 6669
            # (unixTime>=1452115800 and unixTime<=1452116700) or # from run 6675    22hr
            (unixTime>=1452197700 and unixTime<=1452198600) or # from run 6679
            (unixTime>=1452213600 and unixTime<=1452214200) or # from run 6680
            (unixTime>=1452282000 and unixTime<=1452282600) or # from run 6684
            (unixTime>=1452298200 and unixTime<=1452298800) or # from run 6685    possible error
            (unixTime>=1452385500 and unixTime<=1452386400) or # from run 6690
            # (unixTime>=1452457800 and unixTime<=1452458700) or # from run 6694   22 hr
            (unixTime>=1452494100 and unixTime<=1452495000) or # from run 6696   possible error
            # (unixTime>=1452545100 and unixTime<=1452545880) or # from run 6700    could be error or 22hr
            # (unixTime>=1452636900 and unixTime<=1452637500) or # from run 6705   could be error or 22hr
            (unixTime>=1452715200 and unixTime<=1452716100) or # from run 6709   possible error
            (unixTime>=1452972300 and unixTime<=1452973440) or # from run 6724   possible error
            # (unixTime>=1453325400 and unixTime<=1453326600) or # from run 6743   22 hr
            (unixTime>=1453408500 and unixTime<=1453409400) or # from run 6747
            (unixTime>=1453930200 and unixTime<=1453931400) or # from run 6776
            # (unixTime>=1454535000 and unixTime<=1454536500) or # from run 6818   22 hr
            # (unixTime>=1455746400 and unixTime<=1455747900) or # from run 6889   22 hr
            (unixTime>=1456200900 and unixTime<=1456201800) or # from run 6916
            (unixTime>=1456392600 and unixTime<=1456393800) or # from run 6927
            (unixTime>=1456997400 and unixTime<=1456999200) or # from run 6962
            # (unixTime>=1457559000 and unixTime<=1457560800) or # from run 6994   22 hr
            (unixTime>=1460842800 and unixTime<=1460844600) or # from run 7119   22 hr # has CW contam cal pulsers
            # (unixTime>=1461620100 and unixTime<=1461621900) or # from run 7161   22 hr
            (unixTime>=1463002200 and unixTime<=1463004000) or # from run 7243  22 hr # has CW contam cal pulsers
            (unixTime>=1466501400 and unixTime<=1466503200) or # from run 7474
            (unixTime>=1466721900 and unixTime<=1466724600) or # from run 7486 22 hr # has CW contam cal pulsers
            (unixTime>=1466805600 and unixTime<=1466808300) or # from run 7489 22 hr # has CW contam cal pulsers
            (unixTime>=1466890200 and unixTime<=1466892000) or # from run 7494   22 hr # has CW contam cal pulsers
            (unixTime>=1467927600 and unixTime<=1467929700) or # from run 7552   22 hr
            # (unixTime>=1472333400 and unixTime<=1472335200) or # from run 7831   22 hr
            (unixTime>=1473111300 and unixTime<=1473112800) or # from run 7879    22 hr # has CW contam cal
            # (unixTime>=1473370500 and unixTime<=1473372900) or # from run 7899   22 hr
            # (unixTime>=1475011500 and unixTime<=1475013600) or # from run 7993   22 hr
            (unixTime>=1475185200 and unixTime<=1475187900) or # from run 8003 balloon 22hr # has CW contam cal pulsers
            # (unixTime>=1475358000 and unixTime<=1475359800) or # from run 8013 balloon 22hr
            (unixTime>=1475529900 and unixTime<=1475531400) or # from run 8023 balloon 22hr # has CW contam cal pulsers
            # (unixTime>=1475702700 and unixTime<=1475704200) or # from run 8033 balloon 22hr
            (unixTime>=1476221400 and unixTime<=1476222300) # from run 8069 balloon 22hr # has CW contam cal pulsers
            # (unixTime>=1476479700 and unixTime<=1476481800) or # from run 8084 balloon 22hr
            ):
            BadLivetime=True

    elif(station==3):
        if(
            # config 1 from undergrads
            (unixTime>=1380234300 and unixTime<=1380235500) or # from run 1538, 22 hour balloon launch
            (unixTime>=1381008600 and unixTime<=1381010400) or # from run 1584, 22 hour balloon launch
            (unixTime>=1382476200 and unixTime<=1382477400) or # from run 1670, 22 hour balloon launch-ish
            (unixTime>=1382687400 and unixTime<=1382688600) or # from run 1682
            (unixTime>=1382712600 and unixTime<=1382713800) or # from run 1684, 15 hour spike
            (unixTime>=1382972700 and unixTime<=1382973300) or # from run 1698, 15 hour spike
            (unixTime>=1383688800 and unixTime<=1383691500) or # from run 1739, 22 hour balloon launch
            (unixTime>=1384060200 and unixTime<=1384060800) or # from run 1761
            (unixTime>=1384208700 and unixTime<=1384209900) or # from run 1770, 22 hour balloon launch
            (unixTime>=1384486200 and unixTime<=1384492800) or # from run 1786, repeated bursts over ~2 hrs
            (unixTime>=1389399600 and unixTime<=1389400800) or # from run 1980
            (unixTime>=1389744000 and unixTime<=1389747600) or # from run 2001, lots of activity, sweeps in phi
            (unixTime>=1390176600 and unixTime<=1390182000) or # from run 2025
            (unixTime>=1391027700 and unixTime<=1391028900) or # from run 2079, 22 hour balloon launch, but early?
            (unixTime>=1393652400 and unixTime<=1393660800) or # from run 2235, repeated bursts over ~2 hrs
            (unixTime>=1394846400 and unixTime<=1394856000) or # from run 2328, repeated bursts over ~2.5 hours
            (unixTime>=1395437400 and unixTime<=1395438600) or # from run 2363, 22 hour balloon launch
            (unixTime>=1397856300 and unixTime<=1397857800) or # from run 2526, 22 hour balloon launch

            # config 2
            (unixTime>=1390176600 and unixTime<=1390182000) or # from run 3533

            # config 3
            (unixTime>=1409954100 and unixTime<=1409956200) or # from run 3216, 22 hour balloon launch
            (unixTime>=1409986800 and unixTime<=1409988600) or # from run 3217
            (unixTime>=1412026200 and unixTime<=1412028000) or # from run 3332
            (unixTime>=1412284920 and unixTime<=1412287020) or # from run 3347, 22 hour balloon launch
            (unixTime>=1412544120 and unixTime<=1412546400) or # from run 3362, 22 hour balloon launch
            (unixTime>=1412803620 and unixTime<=1412805780) or # from run 3377, 22 hour balloon launch
            (unixTime>=1413897900 and unixTime<=1413899100) or # from run 3439
            (unixTime>=1413914400 and unixTime<=1413922200) or # from run 3440 big wide weird above ground
            (unixTime>=1414083600 and unixTime<=1414086300) or # from run 3449 , 2 spikes
            (unixTime>=1414674000 and unixTime<=1414675500) or # from run 3478
            (unixTime>=1415380500 and unixTime<=1415381400) or # from run 3520
            (unixTime>=1415460600 and unixTime<=1415461500) or # from run 3524
            (unixTime>=1415742000 and unixTime<=1415744100) or # from run 3540 22hr balloon
            (unixTime>=1416207300 and unixTime<=1416209700) or # from run 3568 2 small spikes
            (unixTime>=1416457800 and unixTime<=1416459000) or # from run 3579
            (unixTime>=1416909600 and unixTime<=1416910680) or # from run 3605
            (unixTime>=1416951000 and unixTime<=1416952500) or # from run 3608 22hr balloon
            (unixTime>=1417676400 and unixTime<=1417679400) or # from run 3647
            (unixTime>=1417742400 and unixTime<=1417743600) or # from run 3651
            (unixTime>=1417836600 and unixTime<=1417839300) or # from run 3656
            (unixTime>=1420317000 and unixTime<=1420318200) or # from run 3800
            (unixTime>=1420493700 and unixTime<=1420494600) or # from run 3810 22hr balloon
            (unixTime>=1420513200 and unixTime<=1420515000) or # from run 3811
            (unixTime>=1420598700 and unixTime<=1420600500) or # from run 3816
            (unixTime>=1420857900 and unixTime<=1420859700) or # from run 3830
            (unixTime>=1421019000 and unixTime<=1421020200) or # from run 3840 22hr balloon maybe?
            (unixTime>=1421101800 and unixTime<=1421103600) or # from run 3863 22hr balloon
            (unixTime>=1421723400 and unixTime<=1421723940) or # from run 3910
            (unixTime>=1421750700 and unixTime<=1421751720) or # from run 3912
            (unixTime>=1421868600 and unixTime<=1421881200) or # from run 3977 looks intentional
            (unixTime>=1421881200 and unixTime<=1421884680) or # from run 3978 continuation of thing above
            (unixTime>=1422048900 and unixTime<=1422049800) or # from run 3987 , 22 hour balloon launch
            (unixTime>=1422307200 and unixTime<=1422308100) or # from run 3995 22hr balloon
            (unixTime>=1423660800 and unixTime<=1423661700) or # from run 4132
            (unixTime>=1424819880 and unixTime<=1424820720) or # from run 4200
            (unixTime>=1428529500 and unixTime<=1428531000) or # from run 4412, 22 hour balloon launch
            (unixTime>=1429094400 and unixTime<=1429095600) or # from run 4445
            (unixTime>=1429615800 and unixTime<=1429617600) or # from run 4473
            (unixTime>=1429616700 and unixTime<=1429627500) or # from run 4474
            (unixTime>=1429733400 and unixTime<=1429734600) or # from run 4482
            (unixTime>=1431034500 and unixTime<=1431036900) or # from run 4557 , 22 hour balloon launch
            (unixTime>=1433365500 and unixTime<=1433367900) or # from run 4693
            (unixTime>=1435755600 and unixTime<=1435756500) or # from run 4829
            (unixTime>=1435791000 and unixTime<=1435791600) or # from run 4832
            (unixTime>=1436393700 and unixTime<=1436395500) or # from run 4867
            (unixTime>=1476740100 and unixTime<=1476741300) or # from run 7658
            (unixTime>=1477511400 and unixTime<=1477518300) or # from run 7704, big spike followed by nothing at all
            (unixTime>=1477604700 and unixTime<=1477605900) or # from run 7709,  22 hour balloon launch
            (unixTime>=1477950300 and unixTime<=1477951500) or # from run 7729
            (unixTime>=1479231600 and unixTime<=1479235800) or # from run 7802  , big spike followed by nothing at all


            #config 4
            (unixTime>=1448959200 and unixTime<=1448960100) or # from run 6009
            (unixTime>=1449610500 and unixTime<=1449611400) or # from run 6046 22 hour balloon launch
            (unixTime>=1450119900 and unixTime<=1450120500) or # from run 6077 possible 22 hour balloon launch
            (unixTime>=1450536360 and unixTime<=1450536720) or # from run 6098 spike is at end of time
            (unixTime>=1452116100 and unixTime<=1452116700) or # from run 6188 end of time and possible balloon launch
            (unixTime>=1452196800 and unixTime<=1452198600) or # from run 6193 could be balloon
            (unixTime>=1452213600 and unixTime<=1452214200) or # from run 6194
            (unixTime>=1452282300 and unixTime<=1452282900) or # from run 6198 could be balloon
            (unixTime>=1452298500 and unixTime<=1452299100) or # from run 6199 spike is at end of measured time
            (unixTime>=1452385800 and unixTime<=1452386400) or # from run 6203 spike is at end of measured time
            (unixTime>=1452457800 and unixTime<=1452458700) or # from run 6206 spike is at end of measured time, could be balloon
            (unixTime>=1452494100 and unixTime<=1452494700) or # from run 6208 spike is at end of measured time
            (unixTime>=1452544980 and unixTime<=1452545580) or # from run 6212 could be balloon
            (unixTime>=1452561120 and unixTime<=1452561480) or # from run 6213 spike is at end of measured time
            (unixTime>=1452637020 and unixTime<=1452637260) or # from run 6219 spike is at end of measured time, could be balloon
            (unixTime>=1452715320 and unixTime<=1452715680) or # from run 6223 spike is at end of measured time
            (unixTime>=1452972660 and unixTime<=1452973020) or # from run 6239 spike is at end of measured time
            (unixTime>=1453325400 and unixTime<=1453326300) or # from run 6259 could be balloon
            (unixTime>=1453930500 and unixTime<=1453931100) or # from run 6295 could be balloon
            (unixTime>=1454535000 and unixTime<=1454536200) or # from run 6328 could be balloon
            (unixTime>=1454911200 and unixTime<=1454911800) or # from run 6349 spike is at end of measured time could match below
            (unixTime>=1454911200 and unixTime<=1454912100) or # from run 6350 spike is at start of measured time could match above
            (unixTime>=1455746400 and unixTime<=1455747300) or # from run 6397 could be balloon
            (unixTime>=1456374300 and unixTime<=1456374900) or # from run 6433
            (unixTime>=1457559300 and unixTime<=1457560500) or # from run 6501 could be balloon
            (unixTime>=1460843100 and unixTime<=1460844600) or # from run 6618 spike is at start of measured time, could be balloon
            (unixTime>=1467927840 and unixTime<=1467929640) or # from run 7052 could be balloon
            (unixTime>=1473371280 and unixTime<=1473372180) or # from run 7458 could be balloon
            (unixTime>=1475186100 and unixTime<=1475187000) or # from run 7562 could be balloon
            (unixTime>=1475530500 and unixTime<=1475531700) or # from run 7584 could be balloon
            (unixTime>=1476221400 and unixTime<=1476222600) # from run 7625 could be balloon
            ):
            BadLivetime=True

    return BadLivetime

def works(does):
    does=True

    return does
