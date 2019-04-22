(module
  (func (export "fac-expr") (param $n i64) (result i64)
    (local $i i64)
    (local $res i64)
    (local.set $i (local.get $n))
    (local.set $res (i64.const 1))
    (block $done
      (loop $loop
        (if
          (i64.eq (local.get $i) (i64.const 0))
          (then (br $done))
          (else
            (local.set $res (i64.mul (local.get $i) (local.get $res)))
            (local.set $i (i64.sub (local.get $i) (i64.const 1)))
          )
        )
        (br $loop)
      )
    )
    (local.get $res)
  )

  (func (export "fac-stack") (param $n i64) (result i64)
    (local $i i64)
    (local $res i64)
    (local.get $n)
    (local.set $i)
    (i64.const 1)
    (local.set $res)
    (block $done
      (loop $loop
        (local.get $i)
        (i64.const 0)
        (i64.eq)
        (if
          (then (br $done))
          (else
            (local.get $i)
            (local.get $res)
            (i64.mul)
            (local.set $res)
            (local.get $i)
            (i64.const 1)
            (i64.sub)
            (local.set $i)
          )
        )
        (br $loop)
      )
    )
    (local.get $res)
  )

  (func (export "fac-stack-raw") (param $n i64) (result i64)
    (local $i i64)
    (local $res i64)
    local.get $n
    local.set $i
    i64.const 1
    local.set $res
    block $done
      loop $loop
        local.get $i
        i64.const 0
        i64.eq
        if $body
          br $done
        else $body
          local.get $i
          local.get $res
          i64.mul
          local.set $res
          local.get $i
          i64.const 1
          i64.sub
          local.set $i
        end $body
        br $loop
      end $loop
    end $done
    local.get $res
  )

  (func (export "fac-mixed") (param $n i64) (result i64)
    (local $i i64)
    (local $res i64)
    (local.set $i (local.get $n))
    (local.set $res (i64.const 1))
    (block $done
      (loop $loop
        (i64.eq (local.get $i) (i64.const 0))
        (if
          (then (br $done))
          (else
            (i64.mul (local.get $i) (local.get $res))
            (local.set $res)
            (i64.sub (local.get $i) (i64.const 1))
            (local.set $i)
          )
        )
        (br $loop)
      )
    )
    (local.get $res)
  )

  (func (export "fac-mixed-raw") (param $n i64) (result i64)
    (local $i i64)
    (local $res i64)
    (local.set $i (local.get $n))
    (local.set $res (i64.const 1))
    block $done
      loop $loop
        (i64.eq (local.get $i) (i64.const 0))
        if
          br $done
        else
          (i64.mul (local.get $i) (local.get $res))
          local.set $res
          (i64.sub (local.get $i) (i64.const 1))
          local.set $i
        end
        br $loop
      end
    end
    local.get $res
  )
)
