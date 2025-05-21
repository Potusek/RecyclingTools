import json
import os

def generate_recycling_recipe(name, base_output, better_output):
    """
    Generuje plik JSON z recepturami recyklingu dla danej części narzędzia.
    
    Parametry:
    - name: nazwa części narzędzia (np. 'knifeblade', 'axehead')
    - base_output: ilość kawałków metalu odzyskiwanych przez zwykłe dłuta
    - better_output: ilość kawałków metalu odzyskiwanych przez stalowe dłuto
    """
    
    recipes = [
        # Miedziane dłuto - tylko miękkie metale
        {
            "ingredientPattern": "C,B",
            "ingredients": {
                "C": { "type": "item", "code": "game:chisel-*", "isTool": True, "toolDurabilityCost": 5, "allowedVariants": ["copper"]},
                "B": { "type": "item", "code": f"game:{name}-*", "name": "metal", "allowedVariants": ["silver", "gold", "copper", "tinbronze", "bismuthbronze", "blackbronze"]}
            },
            "width": 1,
            "height": 2,
            "output": { 
                "type": "item", 
                "code": "game:metalbit-{metal}", 
                "quantity": base_output
            },
            "name": f"Recycle {name} into metal bits",
            "shapeless": True,
            "showInCreatedBy": True
        },
        # Brązowe dłuta - miękkie metale + żelazo
        {
            "ingredientPattern": "C,B",
            "ingredients": {
                "C": { "type": "item", "code": "game:chisel-*", "isTool": True, "toolDurabilityCost": 5, "allowedVariants": ["tinbronze", "bismuthbronze", "blackbronze"]},
                "B": { "type": "item", "code": f"game:{name}-*", "name": "metal", "allowedVariants": ["silver", "gold", "copper", "tinbronze", "bismuthbronze", "blackbronze", "iron"]}
            },
            "width": 1,
            "height": 2,
            "output": { 
                "type": "item", 
                "code": "game:metalbit-{metal}", 
                "quantity": base_output
            },
            "name": f"Recycle {name} into metal bits",
            "shapeless": True,
            "showInCreatedBy": True
        },
        # Żelazne dłuta - wszystkie metale
        {
            "ingredientPattern": "C,B",
            "ingredients": {
                "C": { "type": "item", "code": "game:chisel-*", "isTool": True, "toolDurabilityCost": 5, "allowedVariants": ["iron", "meteoriciron"]},
                "B": { "type": "item", "code": f"game:{name}-*", "name": "metal", "allowedVariants": ["silver", "gold", "copper", "tinbronze", "bismuthbronze", "blackbronze", "iron", "meteoriciron", "steel"]}
            },
            "width": 1,
            "height": 2,
            "output": { 
                "type": "item", 
                "code": "game:metalbit-{metal}", 
                "quantity": base_output
            },
            "name": f"Recycle {name} into metal bits",
            "shapeless": True,
            "showInCreatedBy": True
        },
        # Stalowe dłuto - wszystkie metale, mniejsze zużycie, lepszy odzysk
        {
            "ingredientPattern": "C,B",
            "ingredients": {
                "C": { "type": "item", "code": "game:chisel-*", "isTool": True, "toolDurabilityCost": 2, "allowedVariants": ["steel"]},
                "B": { "type": "item", "code": f"game:{name}-*", "name": "metal", "allowedVariants": ["silver", "gold", "copper", "tinbronze", "bismuthbronze", "blackbronze", "iron", "meteoriciron", "steel"]}
            },
            "width": 1,
            "height": 2,
            "output": { 
                "type": "item", 
                "code": "game:metalbit-{metal}", 
                "quantity": better_output
            },
            "name": f"Recycle {name} into metal bits",
            "shapeless": True,
            "showInCreatedBy": True
        }
    ]
    
    # Zapisz do pliku
    filename = f"{name}_recycling.json"
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(recipes, f, indent=2)
    
    print(f"Utworzono plik: {filename}")

# Przykładowe użycie
if __name__ == "__main__":
    # Pobierz parametry od użytkownika
    print("Generator receptur recyklingu dla RecyclingTools")
    print("-----------------------------------------------")
    
    while True:
        name = input("Podaj nazwę części narzędzia (np. knifeblade, axehead): ")
        if name:
            break
        print("Nazwa nie może być pusta!")
    
    while True:
        try:
            base_output = int(input("Podaj ilość kawałków metalu dla zwykłych dłut: "))
            if base_output > 0:
                break
            print("Wartość musi być dodatnia!")
        except ValueError:
            print("Podaj poprawną liczbę całkowitą!")
    
    while True:
        try:
            better_output = int(input("Podaj ilość kawałków metalu dla stalowego dłuta: "))
            if better_output > 0:
                break
            print("Wartość musi być dodatnia!")
        except ValueError:
            print("Podaj poprawną liczbę całkowitą!")
    
    # Generuj recepturę
    generate_recycling_recipe(name, base_output, better_output)