import UIKit
import RxSwift

let disposeBag = DisposeBag()

//MARK: Observables
print("\n## observables ##")
Observable.of("a", "b", "c")
    .subscribe {
        print($0)
}.disposed(by: disposeBag)

Observable<String>.create { (observer) -> Disposable in
    observer.onNext("a")
    observer.onCompleted()
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("completed") }, onDisposed: { print("disposed") })

//MARK: Subjects
print("\n## subjects ##")
let subject = PublishSubject<String>()
subject.onNext("issue 1")
subject.subscribe { (event) in
    print(event)
}
subject.onNext("issue 2")
subject.onNext("issue 3")
subject.onCompleted()
subject.onNext("issue 4")
