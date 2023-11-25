+++
title = "Unreal Notification"
date = "2023-11-25T15:40:00+11:00"
image = "img/blog/UE/Notification/UE_Notification.jpg"
draft = false
showonlyimage = false
categories = [ "unreal", "python"]
tags = ["ue4", "ue5", "unreal", "python", "notification"]
weight = 1
description = "Notification Dialog"
+++
Notification Dialog in Python
<!--more-->

{{< load-photoswipe >}}


I couldn't find any information about getting a notification dialog alert in Python. 
So with some help from a colleague, I got to this solution.

It's not perfect.

It doesn't do other notification alert types, crashes when the notification is already present and not cleared, doesn't launch with the correct text.

These are problems, more than likely due to the fact I'm not familiar enough with how to solve them, so I'm keen to post this to get some information on what I've done wrong, but also to post it to let people know this is one way.

Here it is working, as you can see the Header of the notification is the name of the class and the message is 'Running'
{{< figure link="/img/blog/UE/Notification/UE_Notification__anim.gif" alt="EditorUtilityTask Notification">}}

Only way I could get the task edited and finished is in another thread on a timer to call set_task_notification_text() and finish_executing_task() to close it.

Anyway, just a quick post that might be helpful to others. 

{{< gist gist_sha1_hash >}}

[//]: # (<script src="https://gist.github.com/markserena/7a6869c725729e387f549b5b77d9dab9.js"></script>)


{{< highlight python >}}
from threading import Timer
import unreal


@unreal.uclass()
class DeletedUnusedMaterials(unreal.EditorUtilityTask):
    pass


def update_notification(notification, message):
    notification.set_task_notification_text(str(message))
    notification.finish_executing_task()


def create_notification():
    notification = DeletedUnusedMaterials()
    util_subsystem = unreal.get_editor_subsystem(unreal.EditorUtilitySubsystem)
    notification.receive_begin_execution()
    notification.finish_executing_task()
    util_subsystem.register_and_execute_task(notification)
    return notification


def my_function():
    # Create a notification dialog popup
    notification = create_notification()

    # Create a threaded timer to force notification to close
    t = Timer(2.0, lambda: update_notification(notification, 'Hello World!'))
    t.start()

    print("...code...") 
{{< /highlight >}}
[Gist](https://gist.github.com/markserena/7a6869c725729e387f549b5b77d9dab9)

And for the sake of explicitness here is a simple dialog window
{{< highlight python >}}
unreal.EditorDialog.show_message("title", "message", unreal.AppMsgType.OK)
{{< /highlight >}}


<img src="/img/blog/UE/Notification/UE_Notification_Dialog.png" alt="Editor Dialog"  class="center">