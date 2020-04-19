#! /bin/bash

## Sourced from https://stackoverflow.com/a/24728149 All credit goes to the original author.

## This function checks to see if a cron job with same function already exists 
function cronjob_exists(){
    $cronjob_exists=false;
    exec('crontab -l', $crontab);
    if(isset($crontab)&&is_array($crontab)){
        $crontab = array_flip($crontab);
        if(isset($crontab[$1])){
            $cronjob_exists=true;
        }
    }
    return $cronjob_exists;
}

## This function appends a unique cron job to the cron tab
function append_cronjob(){
    if(is_string($1)&&!empty($1)&&cronjob_exists($1)===FALSE){
        //add job to crontab
        exec('echo -e "`crontab -l`\n'.$1.'" | crontab -', $output);
    }
    return $output;
}

## To run this as a script, uncomment the below line with valid command and frequency
# append_cronjob('* /5 * * * * command');
