import ComposableArchitecture
import Foundation
import Models
import Shared

public struct Home: ReducerProtocol {
  public init() {}

  public struct State: Equatable {
    var shouldShowMatchSettings: MatchSettings?
    var shouldShowHistory: Bool
    var shouldShowPlayers: Bool

    public init(shouldShowMatchSettings: MatchSettings?, shouldShowHistory: Bool, shouldShowPlayers: Bool) {
      self.shouldShowMatchSettings = shouldShowMatchSettings
      self.shouldShowHistory = shouldShowHistory
      self.shouldShowPlayers = shouldShowPlayers
    }
  }

  public enum Action: FeatureAction, Equatable {
    public typealias ModuleAction = Never

    public enum Input: Equatable {
      case didTapNewMatch
      case didTapHistory
      case didTapPlayers
    }

    public enum Delegate: Equatable {
      case handleSavePlayers([Player.ID: Player])
      case handleGoBack
    }

    case input(Input)
    case delegate(Delegate)
  }

  public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .input(let inputAction):
      switch inputAction {
      case .didTapNewMatch:
        state.shouldShowMatchSettings = .newMatch
      case .didTapHistory:
        state.shouldShowHistory = true
      case .didTapPlayers:
        state.shouldShowPlayers = true
      }
      return .none
    case .delegate:
      return .none
    }
  }
}
