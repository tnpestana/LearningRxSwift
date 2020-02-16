import UIKit
import RxSwift

let disposeBag = DisposeBag()

//MARK: Observables
print("\n## Observables ##")
Observable.of("a", "b", "c")
    .subscribe {
        print($0)
}.disposed(by: disposeBag)

Observable<String>.create { (observer) -> Disposable in
    observer.onNext("a")
    observer.onCompleted()
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("completed") }, onDisposed: { print("disposed") })

//MARK: Publish Subjects
print("\n## Publish Subjects ##")
let publishSubject = PublishSubject<String>()
publishSubject.onNext("issue 1")
publishSubject.subscribe { (event) in
    print(event)
}
publishSubject.onNext("issue 2")
publishSubject.onNext("issue 3")
publishSubject.onCompleted()
publishSubject.onNext("issue 4")

//MARK: Behaviour Subject
print("\n## Behaviour Subjects ##")
let behaviourSubject = BehaviorSubject(value: "Init value")
behaviourSubject.onNext("last value")
behaviourSubject.subscribe { (event) in
    print(event)
}
behaviourSubject.onNext("issue 1")

//MARK: Replay Subject
print("\n## Replay Subjects ##")
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("issue 1")
replaySubject.onNext("issue 2")
replaySubject.onNext("issue 3")
replaySubject.subscribe { (event) in
    print(event)
}
replaySubject.onNext("issue 4")
replaySubject.onNext("issue 5")
replaySubject.onNext("issue 6")
replaySubject.subscribe { (event) in
    print(event)
}
