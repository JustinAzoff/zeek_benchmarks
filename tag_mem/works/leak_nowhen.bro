##! Attempting to detect local servers hosting redirection spam
@load base/protocols/http
@load ./logflood

module HTTP;

export {

    redef enum HTTP::Tags += {
        SUPER_AWESOME_TAG_FTW,
    };
}

function http_log(rec: HTTP::Info)
{
    if (SUPER_AWESOME_TAG_FTW in rec$tags){
    }
}

redef exit_only_after_terminate = T;
event bro_init()
{
    logflood();
}
