// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaComoras
 * @dev Registro de tecnicas de infusion en medios lipidicos y proteinas marinas.
 * Serie: Sabores de Africa (33/54)
 */
contract CulturaComoras {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 nivelInfusionVainilla; // Uso de vainilla en platos salados (1-10)
        uint256 saturacionCoco;        // Densidad de la leche de coco (1-100)
        bool proteinaCrustaceo;        // Validador de uso de langosta/camarones
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con la Langosta a la Vainilla (Ingenieria de Infusion)
        registrarPlato(
            "Langouste a la Vanille", 
            "Langosta fresca, vainas de vainilla, leche de coco, pimienta blanca.",
            "Infusion de vainilla en leche de coco caliente para crear una emulsion que cocina la langosta a baja temperatura.",
            10, 
            85, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _vainilla, 
        uint256 _coco,
        bool _crustaceo
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            nivelInfusionVainilla: _vainilla,
            saturacionCoco: _coco,
            proteinaCrustaceo: _crustaceo,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
