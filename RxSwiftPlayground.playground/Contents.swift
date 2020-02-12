import UIKit
import RxSwift

let disposeBag = DisposeBag()

Observable.of("a", "b", "c")
    .subscribe {
        print($0)
}.disposed(by: disposeBag)

Observable<String>.create { (observer) -> Disposable in
    observer.onNext("a")
    observer.onCompleted()
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("completed") }, onDisposed: { print("disposed") })

