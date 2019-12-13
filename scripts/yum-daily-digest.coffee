# Description:
#   Creates a daily digest of popular slack threads in your organization.
#
# Dependencies:
#   "hubot-slack": ">= 4.7.1"
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
      reactionSourceUserId = res.message.user.id
      messageAuthorUserId = res.message.item_user.id
      roomId = res.message.room
      room = robot.adapter.client.rtm.dataStore.getChannelGroupOrDMById res.message.room
      reaction = res.message.reaction
      if room.name == "hubot_test"
        robot.logger.debug "YUM DEBUG reaction heard in hubot_test"
        if res.message.type == "added"
          robot.logger.debug "#{reactionSourceUserId} added :#{reaction}: from #{messageAuthorUserId}"
          robot.messageRoom(reactionSourceUserId, "<@#{reactionSourceUserId}> added :#{reaction}: reaction to post by <@#{messageAuthorUserId}>")
        else if res.message.type == "removed"
          robot.logger.debug "#{reactionSourceUserId} removed :#{reaction}: from #{messageAuthorUserId}"
          robot.messageRoom(reactionSourceUserId, "<@#{reactionSourceUserId}> removed :#{reaction}: reaction to post by <@#{messageAuthorUserId}>")