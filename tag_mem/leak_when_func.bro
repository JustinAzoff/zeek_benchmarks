##! Attempting to detect local servers hosting redirection spam
@load base/protocols/http
@load ./logflood

module HTTP;

export {

    redef enum HTTP::Tags += {
        SUPER_AWESOME_TAG_FTW,
    };
}

function go()
{
    when (local hostname = lookup_addr(127.0.0.1)) {
    }
}

function super_awesome_only(rec: HTTP::Info) : bool
{
    go();
    return (SUPER_AWESOME_TAG_FTW in rec$tags);
}

redef exit_only_after_terminate = T;
event bro_init()
{
    Log::remove_default_filter(HTTP::LOG);
    local filter: Log::Filter = [$name="super_awesome", $path="super_awesome", $pred=super_awesome_only];
    Log::add_filter(HTTP::LOG, filter);
    logflood();
}
