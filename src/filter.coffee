# build-dependencies: observable, property, eventstream
# build-dependencies: functionconstruction

Bacon.Observable :: filter = (f, args...) ->
  suspiciousUsage = this instanceof Bacon.EventStream
  convertArgsToFunction this, f, args, (f) ->
    withDescription(this, "filter", f, @withHandler (event) ->
      if suspiciousUsage then console.warn(
        "Bacon.Observable.filter(EventStream) always returns true. Consider converting the EventStream into Property."
      )
      if event.filter(f)
        @push event
      else
        Bacon.more)


