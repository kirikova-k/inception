<?php
if ($_POST['']);
$file=fopen('mes.txt','w+');
fputs($file,$_POST['mes']);
fclose($file);
// echo 'Успешно';
?>