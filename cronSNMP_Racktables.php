<?php
        require_once("config.php");

        if($con=mysql_connect($HOST,$USER,$PASS)){
                if($base=mysql_select_db($BASE)){
                        $SQL1="
SELECT *
FROM Object
WHERE
        objtype_id=8 AND
        comment LIKE \"%SNMP%\"
ORDER BY name";

                        $QUERY1=mysql_query($SQL1);
                        while($DATA1=mysql_fetch_array($QUERY1)){
                                $SNMP=explode(":",$DATA1['comment']);
                                $V=explode(':',@snmp2_get(@trim($SNMP[1]),@trim($SNMP[3]),"SNMPv2-SMI::mib-2.47.1.1.1.1.13.1001",5000));
                                $VERSION=explode("-",str_replace('"','',$V[1]));
                                echo trim($SNMP[1])."\n";
                                for($i=1;$i<=48;$i++){
                                        echo $VERSION[1]."\n";
                                        if(($VERSION[1]=="C2960G")||($VERSION[1]=="C2960S")||($VERSION[1]=="C2960X") ||($VERSION[1]=="C3750G")) $index=101;
                                        else $index=100;

                                        if($i<10) $index*=10;

                                        echo $index.$i."\n";
                                        $ifName=explode(':',@snmp2_get(@trim($SNMP[1]),@trim($SNMP[3]),"ifName.".$index.$i,5000));
                                        $ifAlias=explode(':',@snmp2_get(@trim($SNMP[1]),@trim($SNMP[3]),"ifAlias.".$index.$i,5000));
#                                       print_r($ifName#);
#                                       print_r($ifAlias);
                                        if(!empty($ifName[1])){
                                                $SQL2="UPDATE Port SET label='".trim($ifAlias[1])."' WHERE object_id=".$DATA1['id']." AND name='".strtolower(trim($ifName[1]))."'";
                                                mysql_query($SQL2);
                                                echo @trim($SNMP[1])." ".@trim($DATA1['id'])." ".@trim($ifAlias[1])." ".@trim($ifName[1])."\n";
                                        }
                                }
                        }
                }else echo "Erro ao Selectionar Base: ".mysql_error();
        }else echo "Erro ao conectar: ".mysql_error();


?>
