//
//  Api.Direction.swift
//  BaiTapTongHop

import Foundation

extension ApiManager.Direction {

    struct QuerryString {
        struct direction {
            var originAddress: String
            var destinationAddress: String
            var travelMode: TravelModes
            var url: String {
                return ApiManager.Path.baseURLDirection + "origin=" +
                    originAddress + "&destination=" + destinationAddress + "&mode=" + travelMode.rawValue + "&key=" + "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDMo3+3ctDT9b2o\nH6Ec/JZeFacuf2PlYkKwExTdxyma2FH/VG0tAMuRSYTLc2v9AxTiNlXKreg8jJ5W\ntaRK0Zmmtv8fHAD2l53+CWarf5xudI/AlznG9wHJTpzxs3FC/Ln3mkgVKiD1BcbK\npFCwBEOB/KFYrYCtGoOHY/ZnY2skvR4OvC8VYcoyKYaR0GNUfovBIqjaqYZXSGmj\n7T52IE686Spz29RXz5v7IfEodYiJ6PXxe4yThnK/nG5/3oqJ/OcoCE24TCdsAukD\nYhEX07JcvIDLdahMjB0zJQUdRbetxsn/aHNJx+ZrMvqupob2Iu32ek1cC+jkJ5Sm\nGpmJREjBAgMBAAECggEAB4sMUWcMTw/bIJgf4HloEopCShq8hC9RzXs6lO07OZ+5\nMAv85UCHAHFBEZ3M0Hv9WFRP58Nu0NKPIJub9X0R6J0MvOkTmQNgOcW/cNlomwK1\nbNA2O0EOIg1BiEBIz8MQmNGpUAxoQBfpKr2RUtepZGB7UxE8McVNLV+wLMHzqFw2\nR7xHq/QzVG/irSec3tDVaYU6Uo4dqC2q/tdtIShk+Zd117ztKqnNU8/bok53iY9B\n2yQMViJeY3hoh+cq4oY9gshXBP27AG96ct6eQr/Y5T7NUnbiZPcu5PAiQjHQaVNu\nQ9lO5ZQkyx2j89y11lFipfzBGniUdVrekgVbEpFQVQKBgQD+trdvq/jmMZ4NNQ9A\nhGadm3rXsEa4FzLlk3PVIjbPX0cw1poQgY052lafWoJNc4D+zTGBf2181CdOQsVd\n00G8oahMStYRnCFZXSMiX7E+FKvlgtoQwxgyxE2nLw3B3mlCLPr90NbYmn5Ad6KZ\nVa4JmZoiffDMYk8JmP4Mw7SpdQKBgQDNrAwfXtN+flzjP/Pd9zOk4incQzdcidvL\nzk2zjT1wbN94yQVfGg7GvFcguO49ftzOwEM15eYXjmIhZdmI8QCFQqYS0yQC4OsI\nBbgEblBuLag3v5dykaF/jFMloAEOTRBftW/Ka5yHao6EfLomsHYPsSjapmYKXdV6\nWItcAa9snQKBgH/PRWpmm6U+XnV4G2gfR7JsEw7pqAK1uVdTTvsyiNgzkfBirrn7\nl9bgxTh+3QVqIN86LU4yl8jcV8DAZnK3D7RMVbu6jYIWmvFRd9DGvZROIRcwOqXQ\nj3Lh56ktRjTymlSXZ3Y29aeIljNZFKDmSkcM6TfHhC26YriJKWlURnIFAoGAA+g5\nzrrBb8y8vQBxBI12qLI3M1z/hz2DNGr15OxQ93rKAARpmrXnA/V9/jwlInvve+oB\nHNwCM/5bdOD3cfeKF/39I6xpKbjWHi/loAfsdTtez7hPCzkjBUZIKhXRD1F9dyP+\nPK0wqw3mKTQpYSTHCWNHMGgq1hWUQZ++/f92Mq0CgYEAj8n7D+9Jqs5Fc9mPbCf2\nTAOGZQl1q21RCQyBYQZRmz6MOfeXLC17IhWelYtAvVDtORgkANW2U44oVPr6HU+9\nU+Jq06+QCBELocPmgcnfb5GKCWonI1BepVxn8rLjZYxUW/LUCBooPG4HwgUO/v+o\nCDncWfB/1rJ+/6wJJ6BJ7jA"
            }
        }
    }
}
