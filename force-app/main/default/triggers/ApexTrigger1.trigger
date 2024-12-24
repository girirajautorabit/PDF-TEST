trigger ApexTrigger1 on Account (before insert) {
//dec 21 commit
system.debug('hello world');
}