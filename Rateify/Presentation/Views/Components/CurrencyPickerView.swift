//
//  CurrencyPickerView.swift
//  Rateify
//
//  Created by Salman Mhaskar on 13/06/26.
//

import SwiftUI

struct CurrencyPickerView: View {
    
    let title: String
    
    @Binding var selection: Currency
    
    // Customization
    var cornerRadius: CGFloat = 12
    var borderColor: Color = .blue.opacity(0.3)
    var borderWidth: CGFloat = 1
    var background: AnyShapeStyle = AnyShapeStyle(.clear)
    var titleColor: Color = .secondary
    var valueColor: Color = .primary
    var icon: String = "chevron.down"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(titleColor)

            CustomPickerButton(
                selection: $selection,
                cornerRadius: cornerRadius,
                borderColor: borderColor,
                borderWidth: borderWidth,
                background: background,
                valueColor: valueColor,
                icon: icon
            )
        }
    }
}

private struct CustomPickerButton: View {
    @Binding var selection: Currency

    var cornerRadius: CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
    var background: AnyShapeStyle
    var valueColor: Color
    var icon: String

    @State private var isPresenting = false

    var body: some View {
        Button {
            isPresenting = true
        } label: {
            HStack(spacing: 8) {
                Text(selection.displayName)
                    .foregroundStyle(valueColor)
                    .lineLimit(1)
                Spacer(minLength: 8)
                Image(systemName: icon)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(background)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isPresenting) {
            CurrencyList(selection: $selection) {
                isPresenting = false
            }
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
        .accessibilityLabel("Currency Picker")
        .accessibilityValue(selection.displayName)
    }
}

private struct CurrencyList: View {
    @Binding var selection: Currency
    var onSelect: () -> Void

    var body: some View {
        NavigationStack {
            List {
                ForEach(Currency.allCases) { currency in
                    HStack {
                        Text(currency.displayName)
                        Spacer()
                        if currency == selection {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.tint)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selection = currency
                        onSelect()
                    }
                }
            }
            .navigationTitle("Select Currency")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { onSelect() }
                }
            }
        }
    }
}

