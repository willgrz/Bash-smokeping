#!/usr/bin/php
<?php
 
// this is probably all the configuration you'll need
$f = '/etc/smokeping/targets';
//
$k = file_get_contents($f);
$c = explode("\n\n", $k);
 
function title($input) { return str_replace(" ", "_", $input); }
 
function array_remove_empty($haystack)
{
    foreach ($haystack as $key => $value) {
        if (is_array($value)) {
            $haystack[$key] = array_remove_empty($haystack[$key]);
        }
 
        if (empty($haystack[$key])) {
            unset($haystack[$key]);
        }
    }
 
    return $haystack;
}
 
 
$total = array();
foreach ($c as $group) {
        // Country
        $group = explode("\n", $group);
        $temporaryArray = array();
        $country = $group[0];
        $total[$country] = $temporaryArray;
 
        foreach ($group as $key=>$val) {
                if ($key > 0) {
                        $ispIp = $val;
                        $ipArray = explode(' ', $ispIp);
                        $ipX = count($ipArray);
                        $ipX = $ipX -1;
                        $ip = $ipArray[$ipX];
 
                        $restofline = str_replace(" {$ip}", "", $ispIp);
                        $total[$country][$restofline] = $ip;
                        unset($restofline);
                        unset($ip);
                        unset($ipArray);
                }
 
        }
        unset($temporaryArray);
}
 
// bad code fix
$total = array_remove_empty($total);
 
foreach ($total as $key=>$val) {
 
// ------------- COUNTRY ------------ //
echo <<<heredoc
++ {$key}
menu = {$key}
title = {$key} Connectivity
 
 
heredoc;
// ------------- COUNTRY ------------ //
 
        foreach ($val as $key=>$val) {
                $menuTitle = title($key);
 
// ------------- IP ENTRY ------------ //
echo <<<heredoc
+++ {$menuTitle}
menu = {$key}
title = {$key}
host = {$val}
 
 
heredoc;
// ------------- IP ENTRY ------------ //
 
 
 
        }
}
