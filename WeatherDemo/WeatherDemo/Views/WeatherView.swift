//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Dhruv Rohilla on 16/04/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.haze").font(.system(size: 60))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://img.freepik.com/free-vector/city-landmarks-background-video-conferencing_52683-42598.jpg?w=2000&t=st=1681643277~exp=1681643877~hmac=6c8abe9cad1d3e6c2a66f632de0068449c67101edbc681a4239a464cb627d6a4")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)
                        Text("NEW DELHI, INDIA")
                            .fontWeight(.heavy)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("WEATHER AT THIS MOMENT")
                            .bold().padding(.bottom)
                            .foregroundColor(.teal)
                        
                        HStack {
                            WeatherRow(logo: "thermometer.low", name: "LOW", value: (weather.main.temp_min.roundDouble() + "°"))
                                .foregroundColor(.black)
                            Spacer()
                            WeatherRow(logo: "thermometer.high", name: "HIGH         ", value: (weather.main.temp_max.roundDouble() + "°"))
                                .foregroundColor(.black)
                        }
                        HStack {
                            WeatherRow(logo: "wind", name: "WIND SPEED", value: (weather.wind.speed.roundDouble() + "m/s"))
                                .foregroundColor(.black)
                            Spacer()
                            WeatherRow(logo: "humidity.fill", name: "HUMIDITY", value: (weather.main.humidity.roundDouble() + "%"))
                                .foregroundColor(.black)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.216, saturation: 1.0, brightness: 1.0))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.133, saturation: 1.0, brightness: 1.0))
            .preferredColorScheme(.light)
        }
    }
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }
}
