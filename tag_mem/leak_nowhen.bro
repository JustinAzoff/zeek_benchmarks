@load base/protocols/http
@load ./logflood

module HTTP;

export {

    redef enum HTTP::Tags += {
        SUPER_AWESOME_TAG_FTW,
    };
}

event HTTP::log_http(rec: HTTP::Info)
{
    if (SUPER_AWESOME_TAG_FTW in rec$tags) {
    }
}

redef exit_only_after_terminate = T;
event bro_init()
{
    logflood();
}
