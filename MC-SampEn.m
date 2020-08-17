clear
load IS0.txt;                                 %-----------------Loading Test Data
xc=IS0;
% load Xianyang_Daily_Runoff.txt;            
% xc=Xianyang_Daily_Runoff;                   %-----------------Loading Measured Data
t=length(xc);

% ==========================1.Add spike noise to Test data IS0==============================
s = zeros(t, 1);
k = [5 193 421 579 801 1060 1213 1421 1689 1910];
% ====================  p=10%  ==================
k=[1 11	21	31	41	51	61	71	81	91	101	111	121	131	141	151	161	171	181	191	201	211	221	231	241	251	261	271	281	291	301	311	321	331	341	351	361	371	381	391	401	411	421	431	441	451	461	471	481	491	501	511	521	531	541	551	561	571	581	591	601	611	621	631	641	651	661	671	681	691	701	711	721	731	741	751	761	771	781	791	801	811	821	831	841	851	861	871	881	891	901	911	921	931	941	951	961	971	981	991	1001	1011	1021	1031	1041	1051	1061	1071	1081	1091	1101	1111	1121	1131	1141	1151	1161	1171	1181	1191	1201	1211	1221	1231	1241	1251	1261	1271	1281	1291	1301	1311	1321	1331	1341	1351	1361	1371	1381	1391	1401	1411	1421	1431	1441	1451	1461	1471	1481	1491	1501	1511	1521	1531	1541	1551	1561	1571	1581	1591	1601	1611	1621	1631	1641	1651	1661	1671	1681	1691	1701	1711	1721	1731	1741	1751	1761	1771	1781	1791	1801	1811	1821	1831	1841	1851	1861	1871	1881	1891	1901	1911	1921	1931	1941	1951	1961	1971	1981	1991];
a = [rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand];
% ====================  p=5%  ==================
k=[1	21	41	61	81	101	121	141	161	181	201	221	241	261	281	301	321	341	361	381	401	421	441	461	481	501	521	541	561	581	601	621	641	661	681	701	721	741	761	781	801	821	841	861	881	901	921	941	961	981	1001	1021	1041	1061	1081	1101	1121	1141	1161	1181	1201	1221	1241	1261	1281	1301	1321	1341	1361	1381	1401	1421	1441	1461	1481	1501	1521	1541	1561	1581	1601	1621	1641	1661	1681	1701	1721	1741	1761	1781	1801	1821	1841	1861	1881	1901	1921	1941	1961	1981];
a=[rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand];
% ====================  p=20%  ==================
k=[1	6	11	16	21	26	31	36	41	46	51	56	61	66	71	76	81	86	91	96	101	106	111	116	121	126	131	136	141	146	151	156	161	166	171	176	181	186	191	196	201	206	211	216	221	226	231	236	241	246	251	256	261	266	271	276	281	286	291	296	301	306	311	316	321	326	331	336	341	346	351	356	361	366	371	376	381	386	391	396	401	406	411	416	421	426	431	436	441	446	451	456	461	466	471	476	481	486	491	496	501	506	511	516	521	526	531	536	541	546	551	556	561	566	571	576	581	586	591	596	601	606	611	616	621	626	631	636	641	646	651	656	661	666	671	676	681	686	691	696	701	706	711	716	721	726	731	736	741	746	751	756	761	766	771	776	781	786	791	796	801	806	811	816	821	826	831	836	841	846	851	856	861	866	871	876	881	886	891	896	901	906	911	916	921	926	931	936	941	946	951	956	961	966	971	976	981	986	991	996	1001	1006	1011	1016	1021	1026	1031	1036	1041	1046	1051	1056	1061	1066	1071	1076	1081	1086	1091	1096	1101	1106	1111	1116	1121	1126	1131	1136	1141	1146	1151	1156	1161	1166	1171	1176	1181	1186	1191	1196	1201	1206	1211	1216	1221	1226	1231	1236	1241	1246	1251	1256	1261	1266	1271	1276	1281	1286	1291	1296	1301	1306	1311	1316	1321	1326	1331	1336	1341	1346	1351	1356	1361	1366	1371	1376	1381	1386	1391	1396	1401	1406	1411	1416	1421	1426	1431	1436	1441	1446	1451	1456	1461	1466	1471	1476	1481	1486	1491	1496	1501	1506	1511	1516	1521	1526	1531	1536	1541	1546	1551	1556	1561	1566	1571	1576	1581	1586	1591	1596	1601	1606	1611	1616	1621	1626	1631	1636	1641	1646	1651	1656	1661	1666	1671	1676	1681	1686	1691	1696	1701	1706	1711	1716	1721	1726	1731	1736	1741	1746	1751	1756	1761	1766	1771	1776	1781	1786	1791	1796	1801	1806	1811	1816	1821	1826	1831	1836	1841	1846	1851	1856	1861	1866	1871	1876	1881	1886	1891	1896	1901	1906	1911	1916	1921	1926	1931	1936	1941	1946	1951	1956	1961	1966	1971	1976	1981	1986	1991];
a=[rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand	rand];
% ====================  p=15%  ==================
k=[1	7	13	19	25	31	37	43	49	55	61	67	73	79	85	91	97	103	109	115	121	127	133	139	145	151	157	163	169	175	181	187	193	199	205	211	217	223	229	235	241	247	253	259	265	271	277	283	289	295	301	307	313	319	325	331	337	343	349	355	361	367	373	379	385	391	397	403	409	415	421	427	433	439	445	451	457	463	469	475	481	487	493	499	505	511	517	523	529	535	541	547	553	559	565	571	577	583	589	595	601	607	613	619	625	631	637	643	649	655	661	667	673	679	685	691	697	703	709	715	721	727	733	739	745	751	757	763	769	775	781	787	793	799	805	811	817	823	829	835	841	847	853	859	865	871	877	883	889	895	901	907	913	919	925	931	937	943	949	955	961	967	973	979	985	991	997	1003	1009	1015	1021	1027	1033	1039	1045	1051	1057	1063	1069	1075	1081	1087	1093	1099	1105	1111	1117	1123	1129	1135	1141	1147	1153	1159	1165	1171	1177	1183	1189	1195	1201	1207	1213	1219	1225	1231	1237	1243	1249	1255	1261	1267	1273	1279	1285	1291	1297	1303	1309	1315	1321	1327	1333	1339	1345	1351	1357	1363	1369	1375	1381	1387	1393	1399	1405	1411	1417	1423	1429	1435	1441	1447	1453	1459	1465	1471	1477	1483	1489	1495	1501	1507	1513	1519	1525	1531	1537	1543	1549	1555	1561	1567	1573	1579	1585	1591	1597	1603	1609	1615	1621	1627	1633	1639	1645	1651	1657	1663	1669	1675	1681	1687	1693	1699	1705	1711	1717	1723	1729	1735	1741	1747	1753	1759	1765	1771	1777	1783	1789	1795];
a=[rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand 	rand	rand];
s(k) = a;
xc=xc+s;                 % Generating a new sequence with spiked noise

% =========================2.Add Gaussian noise to Test data IS0==============================
% db=20                  % Gaussian noise with SNR db =18,20
% xc=awgn(xc,18);        % Generating a new sequence with Gaussian noise

bc=2;                    % bc:Slide remove step size(Test data:bc=2,5,10,20;Measured Data:bc=365)
for ii=1:bc:t-bc
    if(j<ii)
       y(j)=xc(j);
    else
       y(j)=xc(j+bc);
    end                                           % ----------Generating subsequences
    m=2;
    r_saen=0.15*std(y);                           % ----------parameter:m,r 
    saen(ii) = SampEntropy( m, r_saen, y, 1);     % ----------Sample entropy calculation    
end
