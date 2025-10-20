


export type Recipe = {
    label?: string,
    category: string,
    craftingTime: number,
    materials: Record<string, number>,
    materialsNameMap: Record<string, string>,
    toItems: Record<string, number>,
    toMaterialsNameMap: Record<string, string>,
    maxCraft: number,
    type: string,
    metadata?: any
}

export type Recipes = Record<string, Recipe>

export type Table = {
    title: string,
    icon: string,
}
