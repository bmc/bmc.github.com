---
layout: withTOC
title: Minecraft Plugins
---

I run a small, private [Minecraft][] [Bukkit][] server for my daughter and
her friends. Using Josh Cough's [Scala Bukkit plugin API][], I've written a
few server plugins for use on that server. I've made the source of those
plugins available.

Currently, I do _not_ provide binary builds of those plugins, though I
expect to do so in the relatively near future.

Here are the plugins:

* [Creature Catcher][] allows users to capture mobs by throwing eggs or
  snowballs at them. There are other, similar plugins out there, the most
  prominent of which is [MobCatcher][]. However, MobCatcher is far more
  complex than I require. In addition, MobCatcher source is not available;
  to upgrade to a new Bukkit server, you have to wait until MobCatcher's
  author gets around to rebuilding the plugin. By contrast,
  [Creature Catcher][] is open source, so you can recompile it yourself,
  if I don't get to it soon enough.
  
- [Endless Dispenser][] allows users to convert a dispenser into an
  endless, or infinite, dispenser that never runs out of items.

- [Nickname][] allows users to change their display names. Nicknames
  persist across logins _and_ server restarts. The [Essentials][] plugin
  also provides this capability, so my plugin isn't strictly necessary. I
  use my plugin myself, though; and, I keep it around because it's a good
  sample plugin.

[Minecraft]: http://minecraft.net/
[Bukkit]: http://bukkit.org/
[Scala Bukkit plugin API]: https://github.com/joshcough/MinecraftPlugins
[Creature Catcher]: https://github.com/bmc/mc-creature-catcher
[Endless Dispenser]: https://github.com/bmc/mc-endless-dispenser
[Nickname]: https://github.com/bmc/mc-nickname
[MobCatcher]: http://dev.bukkit.org/bukkit-plugins/mobcatcher/
[Essentials]: http://dev.bukkit.org/bukkit-plugins/essentials/

