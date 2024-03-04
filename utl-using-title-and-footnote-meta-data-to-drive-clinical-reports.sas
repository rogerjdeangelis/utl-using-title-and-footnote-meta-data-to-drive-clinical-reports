%let pgm=utl-using-title-and-footnote-meta-data-to-drive-clinical-reports;

Using title and footnote meta data to drive clinical reports

github
https://tinyurl.com/3pa9huyn
https://github.com/rogerjdeangelis/utl-using-title-and-footnote-meta-data-to-drive-clinical-reports

see
https://goo.gl/nj1iDZ
https://communities.sas.com/t5/ODS-and-Base-Reporting/Automatic-generation-of-table-titles-in-long-PDF-reports/m-p/357198

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                          INPUT                                                                         */
/*                                          =====                                                                         */
/*                                                                                                                        */
/*  Work META total obs=2 04MAR2024:10:43:36                                                                              */
/*                                                                                                                        */
/*  TABLENO TITLE1                    TITLE2          FOOT          TABLE                                                 */
/*                                                                                                                        */
/*     1    Patient Disposition  Full Analysis Set DS_T_01.sas  sashelp.class                                             */
/*     2    Patient Labs         Intend to Treat   DS_T_02.sas  sashelp.iris                                              */
/*                                                                                                                        */
/*                                         PROCESS                                                                        */
/*                                         =======                                                                        */
/*   data _null_;                                                                                                         */
/*                                                                                                                        */
/*     set meta;                                                                                                          */
/*     call symputx('tableno',tableno);                                                                                   */
/*     call symputx('desc',title1 );                                                                                      */
/*     call symputx('pop', title2 );                                                                                      */
/*     call symputx('pgm', foot   );                                                                                      */
/*     call symputx('dsn', table  );                                                                                      */
/*                                                                                                                        */
/*     rc=dosubl('                                                                                                        */
/*        options ls=64 ps=20;                                                                                            */
/*        ods proclabel "Table &tableno - &desc - &pop";                                                                  */
/*        title1 j=C  "Table &tableno";                                                                                   */
/*        title2 j=C  "&desc - &pop";                                                                                     */
/*        title3 j=C  "Population:  &pop";                                                                                */
/*        footnote1 j=l   "Program: &pgm  Input: &dsn   Date: &sysdate  ";                                                */
/*        proc report data = &dsn(obs=10)  nowd;                                                                          */
/*        run;quit;                                                                                                       */
/*     ');                                                                                                                */
/*                                                                                                                        */
/*   run;quit;                                                                                                            */
/*                                                                                                                        */
/*                                         OUTPUT DISPOSITION                                                             */
/*                                         ==================                                                             */
/*                                                                                                                        */
/*   Table 1                                     ===> filled in table number                                              */
/*   Patient Disposition - Full Analysis Set     ===> Population                                                          */
/*   Population:  Full Analysis Set                                                                                       */
/*                                                                                                                        */
/*     NAME     SEX        AGE     HEIGHT     WEIGHT                                                                      */
/*                                                                                                                        */
/*     Alfred    M         14         69      112.5                                                                       */
/*     Alice     F         13       56.5         84                                                                       */
/*     Barbara   F         13       65.3         98                                                                       */
/*     Carol     F         14       62.8      102.5                                                                       */
/*     Henry     M         14       63.5      102.5                                                                       */
/*     James     M         12       57.3         83                                                                       */
/*     Jane      F         12       59.8       84.5                                                                       */
/*     Janet     F         15       62.5      112.5                                                                       */
/*     Jeffrey   M         13       62.5         84                                                                       */
/*     John      M         12         59       99.5                                                                       */
/*                                                                                                                        */
/*                                                                                                                        */
/*   Program: DS_T_01.sas  Input: sashelp.class   Date: 04MAR24  ===> Program Input Date                                  */
/*                                                                                                                        */
/*                                                                                                                        */
/*                                         OUTPUT LABS                                                                    */
/*                                         ===========                                                                    */
/*   Table 2                                                                                                              */
/*   Patient Labs - I(ntend to Treat                                                                                      */
/*   Population:  I(ntend to Treat                                                                                        */
/*                                                                                                                        */
/*                     Sepal      Sepal      Petal      Petal                                                             */
/*     Iris           Length      Width     Length      Width                                                             */
/*     Species          (mm)       (mm)       (mm)       (mm)                                                             */
/*     Setosa             50         33         14          2                                                             */
/*     Setosa             46         34         14          3                                                             */
/*     Setosa             46         36         10          2                                                             */
/*     Setosa             51         33         17          5                                                             */
/*     Setosa             55         35         13          2                                                             */
/*     Setosa             48         31         16          2                                                             */
/*     Setosa             52         34         14          2                                                             */
/*     Setosa             49         36         14          1                                                             */
/*     Setosa             44         32         13          2                                                             */
/*     Setosa             50         35         16          6                                                             */
/*                                                                                                                        */
/*                                                                                                                        */
/*   Program: DS_T_02.sas  Input: sashelp.iris   Date: 04MAR24                                                            */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data meta;

tableno  = "1                  ";
title1   = "Patient Disposition";
title2   = "Full Analysis Set  ";
foot     = "DS_T_01.sas        ";
table    = "sashelp.class      ";

output;

tableno  ="2                  ";
title1    ="Patient Labs";
title2    ="Intend to Treat   ";
foot      ="DS_T_02.sas        ";
table     ="sashelp.iris        ";
output;
run;quit;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

data _null_;

  set meta;
  call symputx('tableno',tableno);
  call symputx('desc',title1 );
  call symputx('pop', title2 );
  call symputx('pgm', foot   );
  call symputx('dsn', table  );

  rc=dosubl('
     options ls=64 ps=20;
     ods proclabel "Table &tableno - &desc - &pop";
     title1 j=C  "Table &tableno";
     title2 j=C  "&desc - &pop";
     title3 j=C  "Population:  &pop";
     footnote1 j=l   "Program: &pgm  Input: &dsn   Date: &sysdate  ";
     proc report data = &dsn(obs=10)  nowd;
     run;quit;
  ');

run;quit;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                         OUTPUT DISPOSITION                                                             */
/*                                         ==================                                                             */
/*                                                                                                                        */
/*   Table 1                                                                                                              */
/*   Patient Disposition - Full Analysis Set                                                                              */
/*   Population:  Full Analysis Set                                                                                       */
/*                                                                                                                        */
/*     NAME     SEX        AGE     HEIGHT     WEIGHT                                                                      */
/*                                                                                                                        */
/*     Alfred    M         14         69      112.5                                                                       */
/*     Alice     F         13       56.5         84                                                                       */
/*     Barbara   F         13       65.3         98                                                                       */
/*     Carol     F         14       62.8      102.5                                                                       */
/*     Henry     M         14       63.5      102.5                                                                       */
/*     James     M         12       57.3         83                                                                       */
/*     Jane      F         12       59.8       84.5                                                                       */
/*     Janet     F         15       62.5      112.5                                                                       */
/*     Jeffrey   M         13       62.5         84                                                                       */
/*     John      M         12         59       99.5                                                                       */
/*                                                                                                                        */
/*                                                                                                                        */
/*   Program: DS_T_01.sas  Input: sashelp.class   Date: 04MAR24                                                           */
/*                                                                                                                        */
/*                                                                                                                        */
/*                                         OUTPUT LABS                                                                    */
/*                                         ===========                                                                    */
/*   Table 2                                                                                                              */
/*   Patient Labs - I(ntend to Treat                                                                                      */
/*   Population:  I(ntend to Treat                                                                                        */
/*                                                                                                                        */
/*                     Sepal      Sepal      Petal      Petal                                                             */
/*     Iris           Length      Width     Length      Width                                                             */
/*     Species          (mm)       (mm)       (mm)       (mm)                                                             */
/*     Setosa             50         33         14          2                                                             */
/*     Setosa             46         34         14          3                                                             */
/*     Setosa             46         36         10          2                                                             */
/*     Setosa             51         33         17          5                                                             */
/*     Setosa             55         35         13          2                                                             */
/*     Setosa             48         31         16          2                                                             */
/*     Setosa             52         34         14          2                                                             */
/*     Setosa             49         36         14          1                                                             */
/*     Setosa             44         32         13          2                                                             */
/*     Setosa             50         35         16          6                                                             */
/*                                                                                                                        */
/*                                                                                                                        */
/*   Program: DS_T_02.sas  Input: sashelp.iris   Date: 04MAR24                                                            */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
