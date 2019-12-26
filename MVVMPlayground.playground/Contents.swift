import UIKit

protocol Wireframe {
  var controller: UIViewController { get }
}

final class ViewWireframe: Wireframe {
  var controller: UIViewController {
  }
}

final class ViewController: UIViewController {
  var viewModel: ViewControllerViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel?.testLoad()
  }
}

protocol ViewControllerViewModel: class {
  func testLoad()
}

final class ViewControllerViewViewModel: ViewControllerViewModel {
  private let useCase: ViewUseCaseInterface

  init(useCase: ViewUseCaseInterface) {
    self.useCase = useCase
  }

  func testLoad() {
    useCase.requestLoad()
  }
}

protocol ViewUseCaseInterface: class {
  func requestLoad()
}

final class ViewControllerUseCase: ViewUseCaseInterface {
  private let repository: ViewRepositoryInterface

  init(repository: ViewRepositoryInterface) {
    self.repository = repository
  }

  func requestLoad() {
    repository.letsDoIt()
  }
}

protocol ViewRepositoryInterface: class {
  func letsDoIt()
}

final class ViewRepository: ViewRepositoryInterface {
  func letsDoIt() {
    
  }
}
