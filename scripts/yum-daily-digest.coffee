# Description:
#   Creates a daily digest of popular slack threads in your organization.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Jason Petterson (aka KingOfBananas)

module.exports = (robot) ->
  robot.hearReaction (res) ->
    if res.message.item_user != undefined
      messageAuthorUserId = res.message.user.id
      reactionSourceUserId = res.message.item_user.id
      roomId = res.message.room
      room = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById res.message.room
      reaction = res.message.reaction
      if room.name == "hubot_test"
        if res.message.type == "added"
          res.send "> <@#{messageAuthorUserId}> added :#{reaction}: reaction to post by <@#{reactionSourceUserId}>"
        else if res.message.type == "removed"
          res.send "> <@#{messageAuthorUserId}> removed :#{reaction}: reaction to post by <@#{reactionSourceUserId}>"