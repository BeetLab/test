//
//  DependencyService.swift
//  Flickr
//
//  Created by Krasa on 08/09/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

class DependencyService {
    func makeDependencies() {
        DIFramework.shared.register {
            FlickrInternetClient() as InternetClient
        }
        
        DIFramework.shared.register {
            DictionaryState.shared as AppState
        }
        
        DIFramework.shared.register { () -> TestModuleModel in
            var appState: AppState = resolve()
            let model = FlickrModel(internetClient: resolve(), appState: appState)
            appState.callbacks.append(model)
            return model as TestModuleModel
        }
        
        DIFramework.shared.register {
            ГолосуйИлиПроиграешьViewModel(model: resolve()) as TestModuleViewModel
        }
        
        DIFramework.shared.register {
            Router() as RouterProtocol
        }
        
        DIFramework.shared.register {
            TestModuleViewController(viewModel: resolve(), router: resolve())
        }
        
        DIFramework.shared.register {
            GridViewController(viewModel: resolve(), router: resolve())
        }
                
        DIFramework.shared.register {
            DetailsViewController(viewModel: resolve(), router: resolve())
        }
    }
}
