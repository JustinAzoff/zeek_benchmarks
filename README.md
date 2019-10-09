# Zeek benchmarks

This is some tools and examples for running micro script benchmarks in zeek.  The tooling
doesn't really do anything zeek specific right now, it's somewhat similar to a
tool like https://github.com/sharkdp/hyperfine but I have implemented a few things that make
testing zeek scripts easier.

# Example usage

    $ for  x in record_inline/*.bro;do echo $x;./run.py --iterations 1000000 $x;done
    record_inline/expanded.bro
       1000000 took  1.38           726315 it/sec
       1000000 took  1.31           760844 it/sec
       1000000 took  1.39           717362 it/sec
    record_inline/list.bro
       1000000 took  1.77           564093 it/sec
       1000000 took  1.73           577429 it/sec
       1000000 took  1.78           561267 it/sec
    record_inline/noop.bro
       1000000 took  0.90          1107470 it/sec
       1000000 took  0.90          1111406 it/sec
       1000000 took  0.92          1082442 it/sec
    record_inline/record.bro
       1000000 took  2.19           456583 it/sec
       1000000 took  2.15           464809 it/sec
       1000000 took  2.11           473653 it/sec
    record_inline/record_typed.bro
       1000000 took  2.14           467188 it/sec
       1000000 took  2.89           345789 it/sec
       1000000 took  2.09           477782 it/sec

# Templating

A basic test looks something like this:

    event zeek_init() {
        local x = 0;
        while ( ++x < {{ N }} ) {
            foo();
        }
    }

The `{{ N }}` will be replaced by run.py with either the value of the
`iterations` flag or  dynamically based on the value of the `seconds` flag.

# Advanced Templating

You can template in any arbitrary code based on the `number` flag, like so:

    local s = "";
    s += "my string";
    {% for p in range(number) %}
    s += "more";
    {% endfor %}
    s += "even more";

When ran with `--number 4` this will result in 

    local s = "";
    s += "my string";
    s += "more";
    s += "more";
    s += "more";
    s += "more";
    s += "even more";

A loop could have been used in this case, but see the `set_vs_or_dynamic`
example that uses this to compare the performance of using sets vs or
statements for different numbers of values.
