global hlls: table[count] of opaque of cardinality;
local x = 0;
while ( ++x < 1000000 ) {
    hlls[x] = hll_cardinality_init(0.1, 0.99);
    hll_cardinality_add(hlls[x], 1.2.3.1);
    hll_cardinality_add(hlls[x], 1.2.3.2);
    hll_cardinality_add(hlls[x], 1.2.3.3);
    hll_cardinality_add(hlls[x], 1.2.3.4);
    hll_cardinality_add(hlls[x], 1.2.3.5);
    hll_cardinality_add(hlls[x], 1.2.3.6);
    hll_cardinality_add(hlls[x], 1.2.3.7);
    hll_cardinality_add(hlls[x], 1.2.3.8);
    hll_cardinality_add(hlls[x], 1.2.3.9);
}
