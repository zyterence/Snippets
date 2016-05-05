// Work In The Background
let defaultPriority = DISPATCH_QUEUE_PRIORITY_DEFAULT
let backgroundQueue = dispatch_get_global_queue(defaultPriority, 0)
dispatch_async(backgroundQueue, {
	let result = doSomeExpensiveWork()
	dispatch_async(dispatch_get_main_queue(), {
		//use `result` somehow
	})
})
/*
在实际项目中，除了 DISPATCH_QUEUE_PRIORITY_DEFAULT，我们几乎用不到其他的优先级选项。dispatch_get_global_queue() 将返回一个队列，其中可能有数百个线程在并发执行。如果你经常需要在后台队列执行开销庞大的操作，那可以用 dispatch_queue_create 创建自己的队列，dispatch_queue_create 带两个参数，第一个是需要指定的队列名，第二个说明是串行队列还是并发队列。

注意，每次调用使用的是 dispatch_async 而不是 dispatch_sync。dispatch_async 将在 block 执行前立即返回，而 dispatch_sync 则会等到 block 执行完毕后才返回。内部的调用可以使用 dispatch_sync（因为不在乎什么时候返回），但是外部的调用必须是 dispatch_async（否则主线程会被阻塞）。
*/

// Creating singletons
+ (instancetype) sharedInstance {  
	static dispatch_once_t onceToken;  
	static id sharedInstance;  
	dispatch_once(&onceToken, ^{  
		sharedInstance = [[self alloc] init];  
	});  
	return sharedInstance;  
}
// Swift style singletons
class MyManager  {
    static let sharedInstance = MyManager()
    private init() {}
}

// Flatten a completion block
