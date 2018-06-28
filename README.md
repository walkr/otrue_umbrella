# OtrueUmbrella

Demo for showcasing `mix override: true` bug.


## Steps

Run:

```shell
$ mix deps.get
```

Output:

```shell
Dependencies have diverged:
* rustler (https://github.com/hansihe/rustler)
  different specs were given for the rustler app:

  > In apps/storage/mix.exs:
    {:rustler, [env: :prod, git: "https://github.com/hansihe/rustler", ref: "b6578ea3", sparse: "rustler_mix", override: true, manager: :mix]}

  > In deps/rox/mix.exs:
    {:rustler, [env: :prod, git: "https://github.com/hansihe/rustler", sparse: "rustler_mix"]}

  Ensure they match or specify one of the above in your deps and set "override: true"
** (Mix) Can't continue due to errors on dependencies
```
