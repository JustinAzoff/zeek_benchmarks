function ha()
{
    local h = md5_hash_init();
    md5_hash_update(h, "my string");
    {% for p in range(number) %}
    md5_hash_update(h, "more");
    {% endfor %}
    md5_hash_update(h, "even more");
    md5_hash_finish(h);
}

local x = 0;
while ( ++x < {{ N }} ) {
    ha();
}
