
require 'redis'

#create a new connection with REDIS 
  REDIS=Redis.new
#remove all the keys from the current DB
REDIS.flushdb

#1. SET & GET
 REDIS.SET('server:name', 'fido')
  puts	REDIS.GET('server:name')

#2  DEL & INCR
  REDIS.SET('connections','10')
  puts REDIS.INCR('connections')
  puts REDIS.INCR('connections')
  REDIS.DEL('connections')
  puts REDIS.INCR('connections')

#3 EXPIRE & TTL

 REDIS.SET('resource:lock','Redis Demo 1')
 REDIS.EXPIRE('resource:lock','120')

 puts REDIS.TTL('resource:lock')
 puts REDIS.TTL ('COUNT')

 REDIS.SET('resource:lock','Redis Demo 1')
 REDIS.EXPIRE('resource:lock','120')
 puts REDIS.TTL('resource:lock')
 REDIS.SET('resource:lock','Redis Demo 2')
 puts REDIS.TTL('resource:lock')

#4 RPUSH, LPUSH, LLEN, LRANGE, LPOP, RPOP

 REDIS.RPUSH('friends','TOM')
 REDIS.RPUSH('friends','BOB')
 REDIS.LPUSH('friends','SAM')

 puts REDIS.LRANGE('friends', '0', '-1')
 puts REDIS.LRANGE('friends', '0', '1')
 puts REDIS.LRANGE('friends', '1', '2')

#5 SADD, SREM, SISMEMBER, SMEMBERS & SUNION

 REDIS.SADD('superpowers','flight')
 REDIS.SADD('superpowers','x-ray vision')
 REDIS.SADD('superpowers','reflexes')  

 REDIS.SREM('superpowers','flight')

 puts REDIS.SISMEMBER('superpowers','flight')
 puts REDIS.SISMEMBER('superpowers','reflexes')

 puts REDIS.SMEMBERS('superpowers')

 REDIS.SADD('birdpowers','pecking')
 REDIS.SADD('birdpowers','flight')
 puts REDIS.SUNION('birdpowers','superpowers')


#6 SORTED SET

 REDIS.ZADD('hackers',1940,'Alan Kay')
 REDIS.ZADD('hackers',1953,'RIchard Stallman')
 REDIS.ZADD('hackers',1965,'Yukihiro Matsumoto')
 REDIS.ZADD('hackers',1916,'Claude Shannon')
 REDIS.ZADD('hackers',1969,'Linus Torvalds')
 REDIS.ZADD('hackers',1912,'Alan Turing')

 puts REDIS.ZRANGE('hackers','2','4')

 
	 
