#lang at-exp racket

(require discord-bot)

(define (alert-greeters name)
  @run-js{
  client.channels
  .fetch('710241271075045498')
  .then(channel => {
		channel.send('*Ring ring*  We have someone at the front door!  Their name is @name').then(message => client.destroy())

		})

  })

(define (welcome)
  (alert-greeters (messaging-user-name))
  (~a "Hi!  I've sent a message your behalf to any online villagers with the @greeter role.\n\nIf 10 minutes pass and no one contacts you, don't worry.\n\nWhen a @greeter does come online (even if you've already left), they'll send you a message to schedule a Village Orientation.\n\nAll you have to do is log back in to Discord, and you should see that you have a new message.\n\nThis never takes longer than 24 hours (unless my code is broken).  If you've received no messages from a human villager in the next 24 hours, you should contact support via contact@metacoders.org or call 858-375-4097."))

(define (try-again . args)
  (~a "Hmmm.  That command didn't look quite right."))

(define (maybe-welcome . args)
  (if (string=? (first args) "world")
      (welcome)
      (apply try-again args)))

(define b
  (bot
    ["hello" maybe-welcome] 
    ))

(launch-bot b)


