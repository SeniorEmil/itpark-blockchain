import tonos_ts4.ts4 as ts4

eq = ts4.eq

def test1():
    # Deploy a contract to virtual blockchain
    clc = ts4.BaseContract('calc', {})
    a_num = 2
    b_num = 4
    clc.call_method('set_number', {'a': a_num, 'b': b_num})
    # Call a getter and ensure that we received correct integer value
    assert eq(4, clc.call_getter('result'))

test1()