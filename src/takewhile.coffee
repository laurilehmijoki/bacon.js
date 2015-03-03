# build-dependencies: observable, filter

Bacon.Observable :: takeWhile = (f, args...) ->
  suspiciousUsage = this instanceof Bacon.EventStream
  convertArgsToFunction this, f, args, (f) ->
    withDescription(this, "takeWhile", f, @withHandler (event) ->
      if suspiciousUsage then console.warn(
        "Bacon.Observable.takeWhile(EventStream) always returns true. Consider converting the EventStream into Property."
      )
      if event.filter(f)
        @push event
      else
        @push endEvent()
        Bacon.noMore)
