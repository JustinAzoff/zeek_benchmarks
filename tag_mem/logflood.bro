@load base/protocols/http

event log_one (n:count)
{
    local info: HTTP::Info;
    local id: conn_id;

    id$orig_h = 1.2.3.4;
    id$orig_p = 23121/tcp;
    id$resp_h = 5.6.7.8;
    id$resp_p = 80/tcp;

    info$ts       = network_time();
    info$uid = "CzCai71J2P10svwng2";
    info$id=id;
    info$method="GET";
    info$host="www.google.com";

    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);
    Log::write(HTTP::LOG, info);

    if(n != 0) {
        event log_one(n-1);
    } else {
        terminate();
    }
}

function logflood()
{
    event log_one(1000);
}
